# frozen_string_literal:true

# Authentication controller for API
class Api::AuthenticationController < Api::ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:user][:email])
    if user.valid_password? params[:user][:password]
      render json: { token: JsonWebToken.encode(sub: user.id) }
    else
      render json: { errors: ['Invalid email or password '] }
    end
  end

  def destroy
    session.delete(current_user.id)
    sign_out(current_user)
    render json: { message: 'Successfully sign out.' }
  end
end
