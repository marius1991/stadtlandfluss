class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.where('ready < ?', 2)
    #@games.each do |game|
    # game.delete if game.players.count >= 4
    #end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    user = User.find(session[:user_id])
    if @game.players.exists?(user.id)
    else
      if @game.players.count >= 2
        redirect_to games_path,:notice => 'Spiel ist voll!'
      else
        @game.ready = @game.ready + 1
        @game.save
        @player = @game.players.create(id: user.id, name: user.name)
        @points = @game.scores.create(user_id: user.id, username: user.name)

        i = 1
        @game.max_round_count.times {
          if @game.rounds.where(round_count: i).where.not(player_id: current_user.id).exists?
            char =  @game.rounds.where(round_count: i).where.not(player_id: current_user.id).take.character
          else
            char = CHARS[rand(26)]
          end
          @round = @game.rounds.create(character: char, round_count: i, is_active: true, player_id: @player.id)
          i= i + 1
        }
      end
    end
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.ready = 0
    #respond_to do |format|
      if @game.save
        flash[:notice] = 'Erfolgreich erstellt'
        redirect_to game_path(@game)
        #format.html { redirect_to @game, notice: 'Game was successfully created.' }
        #format.json { render :show, status: :created, location: @game }
      else
        render "new"
        #format.html { render :new }
        #format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :max_round_count)
    end
end
