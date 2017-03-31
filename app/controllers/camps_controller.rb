class CampsController < ApplicationController
before_action :set_organisation, only: [:new]
  def show
    @camp = Camp.find(params[:id])
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(camp_params)
    @camp.user = current_user
    if @camp.save
      redirect_to camps_path(@camp)
    else
      render :new
    end
  end

  private

  def camp_params
    params.require(:camp).permit(:title, :description, :address, :language)
  end

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

end
