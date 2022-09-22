# frozen_string_literal:true

# Application Interactor
class CreateUsers < ApplicationInteractor
  delegate :user, :user_params, to: :context

  def call
    context.user = User.new(user_params)
    return if user.save

    error(user.errors.full_messages.to_sentence)
  end
end
