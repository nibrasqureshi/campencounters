# frozen_string_literal: true

# camps form controller
# rubocop:disable all
class CampFormStepsController < ApplicationController 
  include Wicked::Wizard
  before_action :check_camp_validity, only: %i[update]
  before_action :authenticate_user!
  steps :select_camp,
        :introduction,
        :step_1,
        :step_2,
        :step_3,
        :step_4,
        :step_5,
        :step_6,
        :step_7,
        :step_8,
        :final

  def show
    @user = current_user
    @camps = Camp.active
    @camp = Camp.new  
    render_wizard
  end

  def update
    @user = current_user
    @user.update(selected_camp: params[:camp][:id]) if params[:id] == "introduction"
    @user.update(user_params) if wizard_steps.include?(step)
    sign_in(@user, bypass: true)
    render_wizard
  end

  def wicked_finish; end

  private

  def user_params
    params.require(:user)
          .permit(
            :first_name, 
            :last_name, 
            :phone, 
            :country, 
            :email, 
            :avatar,
            :gender,
            :phone,
            :country,
            :avatar,
            :feedback,
            :camp_id,
            :camp_type,
            :profile_percentage,
            :submission_status,
            id: :user_id
          )
  end

  def wizard_steps
    [
        :step_2,
        :step_3,
        :step_4,
        :step_5,
        :step_6,
        :step_7,
        :step_8,
        :final
    ]
  end

  def check_camp_validity
    return next_wizard_path if params[:camp].blank?
    if params[:camp][:id].present?
      @camp = Camp.find_by(id: params[:camp][:id])
    else
      @camp = Camp.find_by(id: current_user.selected_camp)
    end
    return (redirect_to camp_form_step_path(:select_camp), alert:"registration date has ended for this camp. Select other!") if @camp.applicant_registration_date_end <= Date.today

  end
end
