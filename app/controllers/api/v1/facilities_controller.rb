module Api
  module V1
    class FacilitiesController < ApplicationController

      def index
        # render json: Facility.all
        @facilities = []
        current_user.houses.each do |house|
          @facilities = @facilities + house.facilities
        end
        @facilities = @facilities.uniq
        render json: @facilities
      end

      def show
        render json: Facility.find(params[:id])
      end

    end
  end
end