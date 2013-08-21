require 'spec_helper'

describe "previous words" do
  describe "/words" do
    context "with three words already scored" do
      let(:sample_words){ [['hello', 8], ['HOME', 9], ['HOME', 9], ['Sound', 6]] }

      before(:each) do
        sample_words.each do |word, score|
          visit '/words'
          fill_in 'word[word]', :with => word
          click_link_or_button 'Score'
        end
      end

      xit "displays the last three unique words along with their scores" do
        within("#previous_words") do
          sample_words.last(3).each do |word, score|
            within("#word-#{word.downcase}") do
              expect(page).to have_content(word.downcase)
              expect(page).to have_content(score)
            end
          end
        end
      end
    end
  end
end