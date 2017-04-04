class SlotsController < ApplicationController
before_action :set_camp_orga

  def new
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(slot_params)
    @slot.camp = @camp
    if @slot.save!
      redirect_to camp_path(@camp)
    else
      render :new
    end
  end


  private

  def slot_params
    params.require(:slot).permit(:price, :nbr_surfers, :start_date, :end_date, :camp_id)
  end


  def set_camp_orga
    @camp = Camp.find(params[:camp_id])
    @organisation = @camp.organisation
  end

end

