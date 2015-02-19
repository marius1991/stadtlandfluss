class WelcomeController < ApplicationController
  def index
    redirect_to game_path(Game.find(Player.find(current_user).game_id)) if Player.exists?(current_user)
  end

  def regeln
  end

  def impressum
  end

  def ueber_uns
  end
end
