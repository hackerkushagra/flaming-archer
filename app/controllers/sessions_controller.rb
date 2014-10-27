class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
     session[:user_id] = user.id
     redirect_to admin_url
    else
     redirect_to new_user_path, :notice => "Email doesn't exist in our database" 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_url, :notice => "Logged out"
  end

end
