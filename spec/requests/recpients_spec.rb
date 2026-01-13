describe RecipientsController, type: :request do
  before do
    @campaign = create(:campaign)
  end

  describe 'POST /recipients' do
    before do
      @params = attributes_for(:recipient, campaign_id: @campaign.id)
    end

    it 'should redirect to @campaign' do
      post '/recipients', params: {recipient: @params}
      response.should redirect_to("/campaigns/#{@campaign.to_param}")
    end

    it 'should redirect to new Recipient if "Create and Add Another"' do
      post '/recipients', params: {recipient: @params, commit: 'Create and Add Another'}
      response.should redirect_to("/recipients/new?campaign_id=#{@campaign.id}")
    end

    it 'should render :new if Recipient is not vaild' do
      @params[:name] = nil
      post '/recipients', params: {recipient: @params}
      assert_template :new
    end
  end # POST /recipients
end
