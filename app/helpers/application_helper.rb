# frozen_string_literal:true

# this is application helper
module ApplicationHelper
  def check_data_presence(data)
    data || '_'
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, sort: column, direction: direction, class: 'nav-item'
  end

  def swap_path(user)
    if camp_form_steps_completed?(user)
      r.edit_user_registration_path
    else
      r.camp_form_step_path("step_#{user.profile_percentage / 10}".to_sym, camp: { id: user.selected_camp })
    end
  end

  def profile_text(user)
    camp_form_steps_completed?(user) ? 'My Profile' : 'Complete Camp detail'
  end

  def camp_form_steps_completed?(user)
    user.profile_percentage.eql?(100)
  end

  private

  def r
    Rails.application.routes.url_helpers
  end
end
