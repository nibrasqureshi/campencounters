# frozen_string_literal:true

# Application Interactor
class UpdateCamps < ApplicationInteractor
  delegate :camp, :camp_params, :updated_camp, to: :context

  def call
    context.updated_camp = if context.camp.update(camp_params)
                             true
                           else
                             false
                           end

    error(camp.errors.full_messages.to_sentence)
  end
end
