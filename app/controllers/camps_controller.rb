class CampsController < ApplicationController

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
end
