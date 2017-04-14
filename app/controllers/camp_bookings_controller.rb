class CampBookingsController < ApplicationController
  before_action :set_camp, only: [:create]
  before_action :set_slot, only: [:create]


  def create
    @camp_booking = Camp_booking.new(camp_booking_params)
    @camp_booking.slot = @slot
    @camp_booking.camp = @camp
    @user = current_user
    if @camp_booking.save!
      redirect_to camp_path(@camp)
    else
      render :new
    end
  end


  private

  def camp_booking_params
    params.require(:camp_booking).permit(:nbr_surfers, :slot_id, :camp_id)
  end

  def set_slot
    @slot = Slot.find(params[:slot_id])
  end

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end


end
