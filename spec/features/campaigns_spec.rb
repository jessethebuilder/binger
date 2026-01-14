describe 'Campaigns', type: :feature, js: true do
  describe 'Showing' do
    before do
      @campaign = create(:campaign, :pending)
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

        it 'should update Status of @campaign' do
          visit "/campaigns/#{@campaign.to_param}"
          expect { click_link('Dispatch Campaign') && sleep(2) }
                 .to change { find("#campaign_status .status").text }
                 .from('Status: Pending').to('Status: Completed')
        end

        it 'should update Recipient counter' do
          visit "/campaigns/#{@campaign.to_param}"
          expect { click_link('Dispatch Campaign') && sleep(2) }
                 .to change { find("#campaign_status .sent_count").text }
                 .from('Sent: 0 of 1').to('Sent: 1 of 1')
        end
      end # Dispatching Campaigns
    end # Recipients
  end # Showing
end
