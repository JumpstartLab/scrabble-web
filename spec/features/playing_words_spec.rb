require 'spec_helper'

describe "recording the playing of a word" do
  describe "/words" do
    context "with a word already played" do
      before(:each) do
        visit '/words'
        fill_in 'word[word]', :with => 'hello'
        click_link_or_button 'Score Phrase'
      end
    end

    xit "can record" do
      visit '/words'
      within('')
      within('#last_phrase') do
        within('#phrase') do
          expect(page).to have_content('hello')
        end
        within('#score') do
          expect(page).to have_content('8')
        end
      end
    end
  end
end