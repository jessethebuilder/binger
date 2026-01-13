class DispatchCampaignJob
  include Sidekiq::Job

  def perform(campaign_id)
    @campaign = Campaign.find(campaign_id)
    dispatch_campaign
  end

  private

  def dispatch_campaign
    @campaign.recipients.each do |recipient|
      begin
        send_email(recipient)
      rescue Net::SMTPAuthenticationError
        recipient.update(status: 'failed')
      end
    end
  end

  def send_email(recipient)
    sleep(Random.rand(1..3.seconds)) unless Rails.env.test?
    recipient.update(status: 'sent')
  end
end
