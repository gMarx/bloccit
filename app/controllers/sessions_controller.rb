class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # strong parms would look like this, but not be good here:
    # (email: params.require(:session).permit(:email)[:email].downcase)

    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end

  end

  def destroy
    destroy_session(current_user)
    flash[:notice] = 'You have signed out, return soon!'
    redirect_to root_path
  end
end
