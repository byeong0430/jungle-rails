# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    # create an instance of class User
    @user = User.new
  end

  # signup
  def create
    @user = User.new(user_params)

    if @user.save
      # save user id in cookie session
      session[:user_id] = @user.id
      redirect_to [:root]
    else
      redirect_to %i[sign_up root]
    end
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
