class RecipientsController < ApplicationController
  def index
    @recipients = Recipient.all
  end

  def show
    @recipient = Recipient.find(params[:id])
  end

  def new
    @recipient = Recipient.new(status: 'pending')
  end

  def create
    @recipient = Recipient.build(recipient_params)

    if @recipient.save
      redirect_to @recipient
    else
      render :new
    end
  end

  private

  def recipient_params
    params.require(:recipient).permit(:title, :status)
  end
end
