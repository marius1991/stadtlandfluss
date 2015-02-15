class GamesController < ApplicationController

  def play
    @round = Round.new(:character => CHARS[rand(25)])    
  end
  
  def create
    @round = Round.new()
    #:round['city'], :round['country'], :round['river']

    respond_to do |format|
      if @round.save
        format.html { redirect_to @round, notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
