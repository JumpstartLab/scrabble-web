require 'spec_helper'

describe Word do
  describe 'validations' do
    it "is valid with a word" do
      expect(Word.new(:word => "hi")).to be_valid
    end

    it "is not valid without a word" do
      expect(Word.new).to_not be_valid
    end

    it "does not allow non-letters in words" do
      ['two words', 'exclaim!', '37numbers'].each do |text|
        expect(Word.new(:word => text)).to_not be_valid
      end
    end
  end

  describe '.compute_score' do
    it "scores hello as 8" do
      w = Word.new(:word => 'hello')
      expect(w.compute_score).to eq 8
    end
  end
end
