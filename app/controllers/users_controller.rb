class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    if @user.update_attributes( params.require(:user).permit(:name, :email, :password, :password_confirmation))
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'There was an error creating your account. Please try again.'
      render :new
    end
  end
end
