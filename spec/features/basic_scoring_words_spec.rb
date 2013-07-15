require 'spec_helper'

describe "the basic scoring of a word" do
  describe "/words" do
    xit "allows the input of a word and returns a score" do
      visit '/words'
      fill_in 'word[word]', :with => "HELLO"
      click_link_or_button 'Score'
      expect(current_path).to eq '/words'
      within('#last_word') do
        within('.word') do
          expect(page).to have_content('hello')
        end
        within('.score') do
          expect(page).to have_content('8')
        end
      end
    end

    xit "does not score a blank input" do
      visit '/words'
      fill_in 'word[word]', :with => ""
      click_link_or_button 'Score'
      expect(current_path).to eq '/words'
      within("#flash") do
        expect(page).to have_content("Sorry, please enter at least one word made up of only letters")
      end
    end

    xit "rejects words with non-letter characters" do
      ['exclaim!', '37numbers'].each do |word|
        visit '/words'
        fill_in 'word[word]', :with => word
        click_link_or_button 'Score'
        expect(current_path).to eq '/words'
        within("#flash") do
          expect(page).to have_content("Sorry, please enter at least one word made up of only letters")
        end
      end
    end
  end
end
