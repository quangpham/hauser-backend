module Api
  module V1
    class PinsController < ApplicationController

      def index
        if @pins = House.find(params[:house_id]).pins.order("created_at DESC")
          render json: @pins
        else
          render json: {status: "fail"}
        end
      end

      def create
        @pin = Pin.new(post_params)
        @pin.user_id = current_user.id
        @pin.house_id = params[:house_id]

        house_info = UserHouseR.find_by_user_id_and_house_id(current_user.id, params[:house_id])

        if house_info.room_number
          @pin.from = house_info.room_number + " " + house_info.name_plate.to_s
        else
          @pin.from = current_user.id
        end
        
        if @pin.save
          render json: @pin, status: :created
        else
          render json: @pin.errors, status: :unprocessable_entity
        end
      end

      private
      def post_params
        params.require(:pin).permit(:title, :description, :is_sticky, :photo_url, :icon_url)
      end

    end
  end
end

