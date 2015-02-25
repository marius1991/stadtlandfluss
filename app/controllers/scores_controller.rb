class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
    @game = Game.find(@score.game_id)
    @score.points = 0
    if @game.ready >= 4
      @own_rounds = @game.rounds.where(player_id: current_user.id).each
      @opponent_rounds = @game.rounds.where.not(player_id: current_user.id).each
      @own_rounds.each do |round|
        if round.city.present?
          if round.city[0].capitalize != round.character then
            @score.points = @score.points + 0
          else
            #Weiter prüfen:
            if Citie.exists?(name: round.city.downcase)
              if round.city.downcase == @opponent_rounds.detect{|o| o.round_count == round.round_count}.city.downcase
                @score.points = @score.points + 5
              else
                if @opponent_rounds.detect{|o| o.round_count == round.round_count}.city.present?
                  if @opponent_rounds.detect{|o| o.round_count == round.round_count}.city[0].capitalize == round.character
                    if Citie.exists?(name: @opponent_rounds.detect{|o| o.round_count == round.round_count}.city.downcase)
                      @score.points = @score.points + 10
                    else
                      @score.points = @score.points + 20
                    end
                  else
                    @score.points = @score.points + 20
                  end
                else
                  @score.points = @score.points + 20
                end
              end
            end
          end
        else
          #nichts, Punkte bleiben bei 0
        end

        if round.country.present?
          if round.country[0].capitalize != round.character then
            @score.points = @score.points + 0
          else
            #Weiter prüfen:
            if Countrie.exists?(name: round.country.downcase)
              if round.country.downcase == @opponent_rounds.detect{|o| o.round_count == round.round_count}.country.downcase
                @score.points = @score.points + 5
              else
                if @opponent_rounds.detect{|o| o.round_count == round.round_count}.country.present?
                  if @opponent_rounds.detect{|o| o.round_count == round.round_count}.country[0].capitalize == round.character
                    if Countrie.exists?(name: @opponent_rounds.detect{|o| o.round_count == round.round_count}.country.downcase)
                      @score.points = @score.points + 10
                    else
                      @score.points = @score.points + 20
                    end
                  else
                    @score.points = @score.points + 20
                  end
                else
                  @score.points = @score.points + 20
                end
              end
            end
          end
        else
          #nichts, Punkte bleiben bei 0
        end

        if round.river.present?
          if round.river[0].capitalize != round.character then
            @score.points = @score.points + 0
          else
            #Weiter prüfen:
            if River.exists?(name: round.river.downcase)
              if round.river.downcase == @opponent_rounds.detect{|o| o.round_count == round.round_count}.river.downcase
                @score.points = @score.points + 5
              else
                if @opponent_rounds.detect{|o| o.round_count == round.round_count}.river.present?
                  if @opponent_rounds.detect{|o| o.round_count == round.round_count}.river[0].capitalize == round.character
                    if River.exists?(name: @opponent_rounds.detect{|o| o.round_count == round.round_count}.river.downcase)
                      @score.points = @score.points + 10
                    else
                      @score.points = @score.points + 20
                    end
                  else
                    @score.points = @score.points + 20
                  end
                else
                  @score.points = @score.points + 20
                end
              end
            end
          end
        else
          #nichts, Punkte bleiben bei 0
        end
        @score.is_calculated = true
        @score.save
      end
    else
      #Notiz: Der Gegner spielt noch!
    end
  end

  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:points, :username, :user_id)
    end
end
