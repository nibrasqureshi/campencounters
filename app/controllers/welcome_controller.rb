# frozen_string_literal: true

# this is a welcome controller
class WelcomeController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def new
    @user = User.new
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def index
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:profile_percentage)
  end
end
