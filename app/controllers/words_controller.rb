class WordsController < ApplicationController
  def index
    @last_word = Word.find(params[:last_word_id]) if params[:last_word_id]
    @previous_words = Word.all
    @new_word = Word.new
  end

  def create
    @word = Word.new(params[:word])
    if @word.save
      redirect_to words_path(:last_word_id => @word.id)
    else
      flash[:notice] = "Sorry, please enter a single word made up of only letters"
      redirect_to words_path
    end
  end
end
