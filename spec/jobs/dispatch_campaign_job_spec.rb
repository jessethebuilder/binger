describe DispatchCampaignJob, type: :job do
  before do
    @job = DispatchCampaignJob.new
    @campaign = create(:campaign)
    @recipient = create(:recipient, campaign: @campaign)
  end

  it "should update @recipient's status to 'sent'" do
    expect { @job.perform(@campaign.id) }
           .to change { @recipient.reload.status }
           .from(nil).to('sent')
  end

  it "should update @recipient's status to 'failed' on
      Net::SMTPAuthenticationError" do
    allow(@job).to receive(:send_email)
               .with(@recipient)
               .and_raise(Net::SMTPAuthenticationError.new('Error Message'))

    expect { @job.perform(@campaign.id) }
           .to change { @recipient.reload.status }
           .from(nil).to('failed')
  end
end
# Net::SMTPAuthenticationError
