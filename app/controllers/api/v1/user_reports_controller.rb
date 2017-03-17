module Api
  module V1
    class UserReportsController < ApiController

      def new
        @report = UserReport.new
        @report.user_id = params[:user_id]
        @report.longitude = params[:longitude]
        @report.latitude = params[:latitude]
        @report.description = params[:description]
        @report.smell_intensity = params[:smell_intensity]
        @report.save
        render json: @report
      end

      def create
        @report = @neighborhood.reports.last
        render json: @report
      end

      def index
        @report = Report.last
        render json: @report
      end

      def show
        @report = Report.last
        render json: @report
      end
    end

    private

    def user_report_params
      params.permit(:user_id, :longitude, :latitude, :description, :smell_intensity)
    end
  end
end
