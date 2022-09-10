# frozen_string_literal: true

# registrations controller for devise
class RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters

  def index; end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:agreement, :first_name, :last_name, :email, :password, :password_confirmation, :phone, :country)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :current_password, :phone, :country)
    end
  end
end
