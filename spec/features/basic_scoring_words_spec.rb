require 'spec_helper'

describe "the basic scoring of a word" do
  describe "/words" do
    it "allows the input of a word and returns a score" do
      visit '/words'
      fill_in 'word', :with => "hello"
      click_link_or_button 'submit'
      expect(current_path).to eq '/words'
      within('last_word') do
        within('word') do
          expect(page).to have_content('hello')  
        end
        within('score') do
          expect(page).to have_content('8')
        end
      end
    end
  end
end