# frozen_string_literal: true

# Authorization helpers (Uses Pundit)
#
# Pundit is an ActiveSupport::Concern and will be lazy evaluated, this is
# the reason for the authorize method being defined in the included block.
#
# See here: https://engineering.appfolio.com/appfolio-engineering/2013/06/17/ruby-mixins-activesupportconcern
#
module Authorization
  extend ActiveSupport::Concern
  include Pundit

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    alias_method :pundit_authorize, :authorize

    def authorize(*args)
      authenticate_user!
      pundit_authorize(*args)
    end

    def user_not_authorized(_exception)
      flash[:alert] = 'Not Authorized.'
      return redirect_to root_path if current_user.present?

      redirect_to new_user_session_path
    end

    protected :authorize, :user_not_authorized
  end
end
