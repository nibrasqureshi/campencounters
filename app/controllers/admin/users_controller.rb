class Admin::UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end
  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  def update
    if @user.update(post_params)
      redirect_to ([:admin, @user])
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def post_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
