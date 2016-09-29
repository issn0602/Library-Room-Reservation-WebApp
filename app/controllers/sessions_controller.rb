class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.password == (params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      if user.role == 'user'
        redirect_to  '/member/home'
      else if user.role == 'admin' or user.role == 'sadmin'
              redirect_to  '/admin/home'
           end
      end

    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
