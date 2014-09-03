module Api
  module V1
    class HousesController < ApplicationController

      def index
        render json: House.all
      end

      def show
        @house = House.find(params[:id])
        is_member = @house.user_ids.include?(current_user.id)
        render json: {info: @house, is_member: is_member}
      end

      def get_facilities
        render json: House.find(params[:id]).facilities
      end

      def add_user
        if House.find(params[:id]).add_user(current_user)

          house_info = UserHouseR.find_by_user_id_and_house_id(current_user.id, params[:id])
          pin_message = current_user.full_name + " moved in!"
          pin_message = house_info.room_number + " / " + pin_message if house_info.room_number
          

          Pin.create(house_id: params[:id], description: pin_message)
          
          render json: {status: "okie"}
        else
          render json: {status: "fail"}
        end
      end

      def remove_user
        if House.find(params[:id]).remove_user(current_user)
          
          house_info = UserHouseR.find_by_user_id_and_house_id(current_user.id, params[:id])
          pin_message = current_user.full_name + " moved out!"
          #pin_message = house_info.room_number + " / " + pin_message if house_info.room_number
          Pin.create(house_id: params[:id], description: pin_message)
          
          render json: {status: "okie"}
        else
          render json: {status: "fail"}
        end
      end

    end
  end
end