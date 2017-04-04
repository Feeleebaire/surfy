class SlotsController < ApplicationController

  def create
    @slot = Slot.new(params)
  end


  private

  def slot_params
    params.require(:slot).permit(:price, :nbr_surfers, :start_date, :end_date, :camp_id)
  end

end

