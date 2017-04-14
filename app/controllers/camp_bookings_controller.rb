class CampBookingsController < ApplicationController
  before_action :set_camp, only: [:new, :create]
  #before_action :set_slot, only: [:new, :create]


  def create
    @camp_booking = CampBooking.new(camp_booking_params)
    @camp_booking.camp = @camp
    #@camp_booking.slot = @slot
    @user = current_user
    @camp_booking.user = @user
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
    @slots = Slot.find(params[:slot_id])
  end

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end


end
