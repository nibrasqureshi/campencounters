# frozen_string_literal:true

# Application Interactor
class UpdateUsers < ApplicationInteractor
  delegate :user, :user_params, :updated_user, to: :context

  def call
    context.updated_user = if context.user.update(user_params)
                             true
                           else
                             false
                           end

    error(user.errors.full_messages.to_sentence)
  end
end
