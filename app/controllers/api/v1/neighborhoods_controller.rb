module Api
  module V1
    class NeighborhoodsController < ApplicationController
      # before_filter :restrict_access

      def index
        @neighborhoods = Neighborhood.all
        render json: @neighborhoods
      end

      def show
        @neighborhood = Neighborhood.find(params[:id])
        render json: @neighborhood
      end

      private

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end
    end
  end
end
