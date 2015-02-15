class RundesController < ApplicationController
  before_action :set_runde, only: [:show, :edit, :update, :destroy]

  # GET /rundes
  # GET /rundes.json
  def index
    @rundes = Runde.all
  end

  # GET /rundes/1
  # GET /rundes/1.json
  def show
  end

  # GET /rundes/new
  def new
    @runde = Runde.new
  end

  # GET /rundes/1/edit
  def edit
  end

  # POST /rundes
  # POST /rundes.json
  def create
    @runde = Runde.new(runde_params)

    respond_to do |format|
      if @runde.save
        format.html { redirect_to @runde, notice: 'Runde was successfully created.' }
        format.json { render :show, status: :created, location: @runde }
      else
        format.html { render :new }
        format.json { render json: @runde.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rundes/1
  # PATCH/PUT /rundes/1.json
  def update
    respond_to do |format|
      if @runde.update(runde_params)
        format.html { redirect_to @runde, notice: 'Runde was successfully updated.' }
        format.json { render :show, status: :ok, location: @runde }
      else
        format.html { render :edit }
        format.json { render json: @runde.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rundes/1
  # DELETE /rundes/1.json
  def destroy
    @runde.destroy
    respond_to do |format|
      format.html { redirect_to rundes_url, notice: 'Runde was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runde
      @runde = Runde.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def runde_params
      params.require(:runde).permit(:buchstabe, :stadt, :land, :fluss, :punkte)
    end
end
