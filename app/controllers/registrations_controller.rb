# frozen_string_literal: true

# registrations controller for devise
class RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters
  before_action :authenticate_user!

  def index; end

  def update_resource(resource, params)
    if !params[:password].blank?
      resource.password = params[:password]
      resource.password_confirmation = params[:password_confirmation]
    else
      super
    end

    resource.update_without_password(params)
  end

  protected

  def configure_permitted_parameters # rubocop:disable Metrics/MethodLength
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :agreement,
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :phone,
        :country,
        :avatar
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :phone,
        :country,
        :avatar
      )
    end
  end
end
