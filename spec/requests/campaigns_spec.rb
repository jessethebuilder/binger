describe CampaignsController, type: :request do
  describe 'GET :dispatch_campaign' do
    before do
      @campaign = create(:campaign)
      @recipient = create(:recipient, campaign: @campaign)
      allow(DispatchCampaignJob).to receive(:perform_async)
    end

    it 'should update @recipient status to "sent"' do
      expect { get "/campaigns/#{@campaign.to_param}/dispatch_campaign" }
             .to change { @recipient.reload.status }.from(nil).to('sent')
    end

    it 'should update @campaign status to "completed"' do
      @campaign.update(status: 'pending')
      expect { get "/campaigns/#{@campaign.to_param}/dispatch_campaign" }
             .to change { @campaign.reload.status }.to('completed')
    end

    it 'should call DispatchCampaignJob' do
      expect(DispatchCampaignJob).to receive(:perform_in)
            .with(1.second, @campaign.id)
      get "/campaigns/#{@campaign.to_param}/dispatch_campaign"
    end
  end # GET :dispatch_campaign

  describe 'GET :new' do
    describe '@campaign' do
      it 'should be a new Campaign' do
        get '/campaigns/new'
        assigns[:campaign].should be_a_new(Campaign)
      end

      specify ':status should be "pending"' do
        get '/campaigns/new'
        assigns[:campaign].status.should == 'pending'
      end
    end # @campaign
  end # GET :new
end
