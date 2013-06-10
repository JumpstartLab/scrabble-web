require 'spec_helper'

describe "the basic scoring of a word" do
  describe "/words" do
    it "allows the input of a word and returns a score" do
      visit '/words'
      fill_in 'word[word]', :with => "hello"
      click_link_or_button 'Score Word'
      expect(current_path).to eq '/words'
      within('#last_word') do
        within('#word') do
          expect(page).to have_content('hello')  
        end
        within('#score') do
          expect(page).to have_content('8')
        end
      end
    end

    it "does not score a blank input" do
      visit '/words'
      fill_in 'word[word]', :with => ""
      click_link_or_button 'Score Word'
      expect(current_path).to eq '/words'
      within("#flash") do
        expect(page).to have_content("Sorry, please enter a single word made up of only letters")
      end
    end

    it "rejects words with non-letter characters" do
      ['two words', 'exclaim!', '37numbers'].each do |word|
        visit '/words'
        fill_in 'word[word]', :with => word
        click_link_or_button 'Score Word'
        expect(current_path).to eq '/words'
        within("#flash") do
          expect(page).to have_content("Sorry, please enter a single word made up of only letters")
        end
      end
    end

    context "with three words already scored" do
      let(:sample_words){ [['hello', 8], ['home', 9], ['sound', 6]] }

      before(:each) do
        sample_words.each do |word, score|
          visit '/words'
          fill_in 'word[word]', :with => word
          click_link_or_button 'Score Word'
        end
      end

      it "displays the last three words along with their scores" do
        within("#previous_words") do
          sample_words.each do |word, score|
            expect(page).to have_content(word)
            expect(page).to have_content(score)
          end
        end
      end
    end
  
  end
end