# frozen_string_literal:true

# this is a user controller class for admin
class Api::Admin::UsersController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  before_action :set_users, only: %i[index]
  before_action :find_user, only: %i[show edit update destroy]
  before_action :authorize_request
  helper_method :sort_column, :sort_direction

  def index
    @users = User.order(id: :desc)
  end

  def show; end

  def edit; end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  def update
    if @user.update(user_params)
      redirect_to([:admin, @user])
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
  end

  def create
    result = CreateUsers.call(user_params: user_params)
    @user = result.camp
    if result.success?
      UserMailer.welcome_email(@user).deliver_now
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :country, :email, :password, :password_confirmation,
                                 :avatar, :profile_percentage, :submission_status)
  end

  def sort_column
    params[:sort] || 'first_name'
  end

  def sort_direction
    params[:direction] || 'asc'
  end

  def csv_policy(records, attributes)
    CsvExport.new(records, attributes)
  end

  def attributes
    %w[id first_name last_name email phone country created_at]
  end

  def set_users
    @users = if params[:search].present?
               User.search(params[:search]).page(params[:page])
             else
               User.order("#{sort_column} #{sort_direction}").page(params[:page])
             end
  end

  def authorize_request
    authorize(current_user)
  end
end
