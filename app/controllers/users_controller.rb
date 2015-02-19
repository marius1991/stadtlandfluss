class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Erfolgreich registriert!'
      redirect_to root_url#, :notice => "Erfolgreich angemeldet!"
      UserMailer.signup_confirmation(@user).deliver
    else
      render "new" #Mal als symbol probieren
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    flash[:success] = "Profile updated"
    redirect_to root_url
  else
      render 'edit'
    end
  end
  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
