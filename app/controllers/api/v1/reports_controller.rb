module Api
  module V1
    class ReportsController < ApiController

      def index
        @neighborhood = Neighborhood.find(params[:neighborhood_id])
        @reports = @neighborhood.reports.all
        render json: @reports
      end

      def show
        @neighborhood = Neighborhood.find(params[:neighborhood_id])
        @report = @neighborhood.reports.last
        render json: @report
      end
    end
  end
end
