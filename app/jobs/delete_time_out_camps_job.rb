# frozen_string_literal:true

# Job for deleting unnecessary camps
class DeleteTimeOutCampsJob < ApplicationJob
  queue_as :default

  def perform
    User.where(camp_id: camps.pluck(:id)).update_all(camp_id: nil)

    camps.destroy_all
  end

  private

  def camps
    Camp.where('applicant_registration_date_end < ?', Date.today)
  end
end
