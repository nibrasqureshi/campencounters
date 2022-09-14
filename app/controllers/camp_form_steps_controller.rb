# frozen_string_literal: true

# camps form controller
class CampFormStepsController < ApplicationController
  include Wicked::Wizard

  before_action :check_camp_validity, only: %i[update]

  steps :select_camp,
        :introduction,
        :step_1,
        :step_2,
        :step_3,
        :step_4,
        :step_5,
        :step_6,
        :step_7,
        :step_8

  def show
    @user = current_user
    @camps = Camp.active
    @camp = Camp.new
    render_wizard
  end

  def update
    @user = current_user
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
            :password, 
            :avatar,
            :gender,
            :password,
            :phone,
            :country,
            :avatar,
            :feedback,
            :camp_type,
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
        :step_8
      ]
  end

  def check_camp_validity
    return if params[:camp][:id].blank?
    @camp = Camp.find_by(id: params[:camp][:id])
    return (redirect_to camp_form_step_path(:select_camp), alert:"The registration date has ended for this camp. Select other!") if @camp.applicant_registration_date_end <= Date.today
  end
end
