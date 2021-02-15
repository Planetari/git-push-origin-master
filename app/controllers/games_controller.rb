class GamesController < ApplicationController

  def new
    @letters = (0..9).map { || ("a".."z").to_a.sample }
  end

  def score
    @word = params[:word]
    #binding.pry

    require 'json'
    require 'open-uri'

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    result_serialized = open(url).read
    result = JSON.parse(result_serialized)

    @valid_english_word = result["found"]
    #binding.pry
    if @valid_english_word
      @message = "You won"
    else
      @message = "You lost"
    end
  end

end
