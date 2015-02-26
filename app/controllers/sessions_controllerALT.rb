class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Angemeldet!"
    else
      flash.now[:alert] = "Falsche E-Mail oder falsches Passwort!"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Abgemeldet!"
  end
end
