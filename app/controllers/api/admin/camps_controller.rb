# frozen_string_literal: true

# camps controller for admin
class Api::Admin::CampsController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  before_action :authorize_request
  before_action :set_camps, only: %i[index]
  before_action :find_camp, only: %i[show edit update destroy update_status]
  helper_method :sort_column, :sort_direction

  def index
    respond_to do |format|
      format.html {}
      format.csv do
        send_data ExportService::CampExport.new(Camp.all).to_csv, filename: "campinfo-#{Date.today}.csv"
      end
    end
  end

  def show; end

  def edit; end

  def destroy
    @camp.destroy
    redirect_to admin_camps_path
  end

  def update
    if @camp.update(camp_params)
      redirect_to([:admin, @camp])
    else
      render 'edit'
    end
  end

  def new
    @camp = Camp.new
  end

  def create
    result = CreateCamps.call(camp_params: camp_params)
    @camp = result.camp
    if result.success?
      redirect_to admin_camps_path
    else
      render 'new'
    end
  end

  def update_status
    @camp.update(status: params[:status])
    @camps = current_user.camps
  end

  private

  def find_camp
    @camp = Camp.find(params[:id])
  end

  def camp_params # rubocop:disable Metrics/MethodLength
    params.require(:camp).permit(
      :camp_title,
      :camp_type,
      :applicant_registration_time,
      :applicant_registration_date,
      :applicant_registration_date_end,
      :applicant_registration_time_end,
      :parent_registration_date,
      :parent_registration_date_end,
      :parent_registration_time,
      :parent_registration_time_end,
      :status,
      :admin_id,
      locations: []
    )
  end

  def sort_column
    params[:sort] || 'camp_title'
  end

  def sort_direction
    params[:direction] || 'asc'
  end

  def csv_policy(records, attributes)
    CsvExport.new(records, attributes)
  end

  def set_camps # rubocop:disable Metrics/AbcSize
    @camps = if params[:search].present?
               Camp.search(params[:search]).page(params[:page])
             else
               current_user.camps.order("#{sort_column} #{sort_direction}").page(params[:page])
             end
  end

  def authorize_request
    authorize(current_user)
  end
end
