# frozen_string_literal: true

# registrations controller for devise
class SessionsController < Devise::SessionsController
  protected

  # The path used after sign in
  #
  def after_sign_in_path_for(resource)
    return admin_camps_path if resource.is_a?(Admin)
    return camp_form_step_path(:select_camp) if resource.is_a?(User) && resource.sign_in_count.eql?(1)

    root_path
  end
end
