describe 'Campaigns', type: :feature, js: true do
  describe 'Showing' do
    before do
      @campaign = create(:campaign)
      @recipient = create(:recipient, campaign: @campaign)
    end

    describe 'Recipients' do
      def recipient_element
        find("tr#recipient_#{@recipient.id}")
      end

      def recipient_status
        recipient_element.find('.status').text
      end

      it 'should show Recipient' do
        visit "/campaigns/#{@campaign.to_param}"
        page.should have_css("tr#recipient_#{@recipient.id}")
      end

      describe 'Dispatching Campaigns' do
        it 'should update :status cell to "Sent", once backgroung job is performed' do
          visit "/campaigns/#{@campaign.to_param}"
          expect { click_link('Dispatch Campaign') }
                 .to change { recipient_status }.to('Sent')
        end
      end # Dispatching Campaigns
    end # Recipients
  end # Showing
end
