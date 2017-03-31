class CampsController < ApplicationController
  def show
    @camp = Camp.find(params[:id])
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(camp_params)
    @camp.save
    raise
      redirect_to camps_path(@camp)

  end

  private

  def camp_params
    params.require(:camp).permit(:title, :description, :address, :language, :organisation_id)
  end


end
