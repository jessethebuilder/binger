class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:dispatch_campaign, :show]

  def dispatch_campaign
    @campaign.recipients.update_all(status: 'queued', updated_at: Time.current)
    @campaign.update(status: 'processing')
    DispatchCampaignJob.perform_in(1.second, @campaign.id) # The delay avoids a possible race condition as page loads.
    redirect_to @campaign
  end

  def index
    @campaigns = Campaign.all
  end

  def show
  end

  def new
    @campaign = Campaign.new(status: 'pending')
  end

  def create
    @campaign = Campaign.build(campaign_params)

    if @campaign.save
      redirect_to @campaign
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title, :status)
  end
end
