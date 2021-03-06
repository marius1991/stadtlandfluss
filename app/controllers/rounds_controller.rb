class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    if  @round.player_id!=User.find(current_user).id
      redirect_to welcome_impressum_path notice: "Player_id: " + @round.player_id.to_s + " Currentuser_id: " + current_user.id.to_s
    else
      if @round.is_active==false
        redirect_to welcome_regeln_path, notice: @round.is_active.to_s
      end
    end
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
    @round.city = round_params[:city]
    @round.country = round_params[:country]
    @round.river = round_params[:river]
    @round.is_active = false
    @round.save
    if @round.round_count < Game.find(@round.game_id).max_round_count
      @next_round = Round.find_by(game_id: @round.game_id, player_id: @round.player_id, round_count: @round.round_count + 1)
      redirect_to round_path(@next_round)
    else
      @score = Score.where(user_id: current_user, game_id: @round.game_id).take
      @player = Player.find(current_user)
      @player.delete
      @game = Game.find(@round.game_id)
      @game.ready = @game.ready + 1
      @game.save
      redirect_to score_path(@score)
    end
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)
    @game = Game.find(@round.game_id)
    if @game.rounds.where(round_count: @round.round_count).not(player_id: current_user.id).take.exists?
      o_round = @game.rounds.where(round_count: @round.round_count).not(player_id: current_user.id).take
      @round.character = o_round.character
    else
      @round.character = CHARS[rand(26)]
    end
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

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_url, notice: 'Round was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      if Round.exists?(id: params[:id])
        @round = Round.find(params[:id])
      else
        redirect_to root_path, alert: 'Spiel bereits gelöscht.'
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:character, :points, :round_count, :city, :country, :river)
    end
end
