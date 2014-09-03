module Api
  module V1
    class UserFacilityBookingsController < ApplicationController

      def index
      	# @bookings = current_user.user_facility_bookings.order("booking_date DESC")
        @bookings = []
        current_user.user_facility_bookings.where("booking_date > ?", 1.day.ago).order("booking_date").group_by(&:booking_date).each do |date, slots|
          booking = {}
          booking[:date] = date
          booking[:slots] = slots
          @bookings.push(booking)
        end
      	render json: @bookings
      	# @bookings = Facility.find(params[:facility_id]).user_facility_bookings
       #  render json: @bookings
      end

      # def show
      # 	# @booking = UserFacilityBooking.find(params[:id])
      #  #  render json: @booking
      # end

		  def create
		  	params[:user_id] = current_user.id
		  	booking = UserFacilityBooking.create_booking(params)
		  	render json: booking
		  end

		  # def destroy
		  #   @booking = UserFacilityBooking.find(params[:id])
		  #   if @booking.destroy
		  #       render json: {status: "booking_destroyed", msg: "Booking is destroyed"}
		  #   else
		  #       render json: {status: "booking_destroyed_error", msg: "Something went wrong"}
		  #   end
		  # end
    end
  end
end

