# frozen_string_literal: true

# login
class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # check if email exists in users table
    @user = User.find_by_email(params[:email])

    # email exists in table and password's been authenticated
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # save user id in cookie session
      session[:user_id] = user.id
      session[:expires_at] = Time.current + 24.hours
      redirect_to :root
    else
      # login failed. send user back to login
      redirect_to [:new, :session], notice: 'Your email or password is incorrect!'
    end

  end

  def destroy
    reset_session
    redirect_to :root
  end
end
