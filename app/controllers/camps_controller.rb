class CampsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_organisation, only: [:new, :create]
  def create
    @camp = Camp.new(camp_params)
    @camp.organisation = @organisation
    if @camp.save
      redirect_to camp_path(@camp)
    else
      render :new
    end
  end

  def index
    @camps = Camp.all
  end

  def show
    @camp = Camp.find(params[:id])
  end

  private

  def camp_params
    params.require(:camp).permit(:title, :description, :address, :language, :organisation_id)
  end

  def set_organisation
    @organisation = Organisation.find(params[:organisation_id])
  end


end
