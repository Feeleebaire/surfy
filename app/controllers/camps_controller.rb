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
    @camps = Camp.where.not(latitude: nil, longitude: nil)
     @hash = Gmaps4rails.build_markers(@camps) do |camp, marker|
      marker.lat camp.latitude
      marker.lng camp.longitude
    end
  end

  def show
    @camp = Camp.find(params[:id])
    @organisation = @camp.organisation
    @camp_booking = CampBooking.new
    @hash = Gmaps4rails.build_markers(@camp) do |camp, marker|
      marker.lat camp.latitude
      marker.lng camp.longitude
    end
      @slots = @camp.slots
  end

  private

  def camp_params
    params.require(:camp).permit(:title, :description, :address, :language, :photo, :photo_cache, :organisation_id)
  end

  def set_organisation
    @organisation = Organisation.find(params[:organisation_id])
  end


end
