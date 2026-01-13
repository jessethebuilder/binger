class RecipientsController < ApplicationController
  def index
    @recipients = Recipient.all
  end

  def show
    @recipient = Recipient.find(params[:id])
  end

  def new
    @recipient = Recipient.new(campaign_id: params[:campaign_id])
  end

  def create
    @recipient = Recipient.build(recipient_params)

    if @recipient.save
      if params[:commit] == 'Create and Add Another'
        redirect_to new_recipient_path(campaign_id: @recipient.campaign.id)
      else
        redirect_to @recipient.campaign
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recipient_params
    params.require(:recipient).permit(
      :name,
      :phone,
      :email,
      :status,
      :campaign_id
    )
  end
end
