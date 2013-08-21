require 'spec_helper'

describe "recording the playing of a word" do
  describe "/words" do
    context "with a word already played" do
      before(:each) do
        visit '/words'
        fill_in 'word[word]', :with => 'hello'
        click_link_or_button 'Score'
      end

      xit "can record" do
        visit '/words'
        within("#word-hello") do
          click_link_or_button('Play')
        end

        expect(current_path).to eq '/words'
        within("#word-hello") do
          page.should have_content("Plays: 1")
        end
      end

      xit "has a time stamp" do
        visit '/words'
        within("#word-hello") do
          click_link_or_button('Play')
        end

        Timecop.freeze(Time.now) do
          expect(current_path).to eq '/words'
          within("#word-hello") do
            page.should have_content(Date.today.strftime("%D"))
          end
        end
      end

      xit "can happen multiple times" do
        3.times do
          visit '/words'
          within("#word-hello") do
            click_link_or_button('Play')
          end
        end

        expect(current_path).to eq '/words'
        within("#word-hello") do
          page.should have_content("Plays: 3")
        end
      end

      xit "has multiple unique time stamps" do
        visit '/words'

        [2, 2, 1, 0].each do |offset|
          Timecop.freeze(Date.today - offset) do
            within("#word-hello") do
              click_link_or_button('Play')
            end
          end
        end

        within("#word-hello") do
          page.should have_content((Date.today - 2).strftime("%D"), :count => 1)
          page.should have_content((Date.today - 1).strftime("%D"))
          page.should have_content(Date.today.strftime("%D"))
        end
      end 
    end
  end
end