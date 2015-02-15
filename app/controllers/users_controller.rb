class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Erfolgreich registriert!'
      redirect_to root_url#, :notice => "Erfolgreich angemeldet!"
    else
      render "new" #Mal als symbol probieren
    end
  end
  
  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
