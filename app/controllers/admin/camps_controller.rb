# frozen_string_literal: true

# camps controller for admin
class Admin::CampsController < ApplicationController
  before_action :find_camp, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction

  def index
    @camps = if params[:search].present?
               Camp.search(params[:search]).page(params[:page])
             else
               Camp.order("#{sort_column} #{sort_direction}").page(params[:page])
             end
    respond_to do |format|
      format.html
      format.csv { send_data ExportService::CampExport.new(Camp.all).to_csv, filename: "campinfo-#{Date.today}.csv" }
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
    @camp = Camp.new(camp_params)
    if @camp.save
      redirect_to admin_camps_path
    else
      render 'new'
    end
  end

  private

  def find_camp
    @camp = Camp.find(params[:id])
  end

  def camp_params
    params.require(:camp).permit(
      :camp_title,
      :camp_type,
      :applicant_registration_time,
      :parent_registration_time,
      locations: []
    )
  end

  def sort_column
    params[:sort] || 'camp_title'
  end

  def sort_direction
    params[:direction] || 'asc'
  end
end
