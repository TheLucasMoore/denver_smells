module Api
  module V1
    class NeighborhoodReportsController < ApplicationController
      def index
        @last_report = {}
        n = Neighborhood.all
        n.each do |neighborhood|
          # key of neighborhood name, value of the last report
          @last_report[neighborhood.name] = neighborhood.reports.last.attributes
        end
        render json: @last_report
      end
    end
  end
end
