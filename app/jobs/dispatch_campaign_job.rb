class DispatchCampaignJob
  include Sidekiq::Job

  def perform(campaign_id)
    @campaign = Campaign.find(campaign_id)
    dispatch_campaign
    @campaign.update(status: 'completed')
    update_status
  end

  private

  def dispatch_campaign
    @campaign.recipients.each do |recipient|
      begin
        send_email(recipient)
      rescue Net::SMTPAuthenticationError
        recipient.update(status: 'failed')
      end

      broadcast_update(recipient)
    end
  end

  def send_email(recipient)
    sleep(Random.rand(1..3.seconds)) unless Rails.env.test?
    recipient.update(status: 'sent')
  end

  def broadcast_update(recipient)
    update_recipient(recipient)
    update_status
  end

  def update_recipient(recipient)
    Turbo::StreamsChannel.broadcast_replace_to(
      [recipient.campaign, :dispatch_campaign_job_channel],
      target: "recipient_#{recipient.id}",
      partial: "campaigns/recipient",
      locals: { recipient: recipient }
    )
  end

  def update_status
    Turbo::StreamsChannel.broadcast_update_to(
      [@campaign, :dispatch_campaign_job_channel],
      target: "campaign_status",
      partial: "campaigns/status",
      locals: { campaign: @campaign }
    )
  end
end
