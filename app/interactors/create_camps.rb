# frozen_string_literal:true

# Application Interactor
class CreateCamps < ApplicationInteractor
  delegate :camp, :camp_params, to: :context

  def call
    context.camp = Camp.new(camp_params)
    return if camp.save

    error(camp.errors.full_messages.to_sentence)
  end
end
