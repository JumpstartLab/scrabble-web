describe Phrase do
  describe "a new phrase" do
    it "has an empty list of words" do
      expect(Phrase.new.words).to eq([])
    end
  end

  it "has many words"

  describe "#phrase" do
    it "puts the words back together again"
  end

  describe "#score" do
    it "computes the total score for all the words"
  end

  it "returns #words sorted by score, descending"
end
