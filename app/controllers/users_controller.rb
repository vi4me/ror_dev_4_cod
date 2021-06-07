# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def me
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to me_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :avatar, :appointment_id, :doctor)
  end
end
