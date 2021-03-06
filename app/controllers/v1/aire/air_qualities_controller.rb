require 'httparty'
require 'open-uri'

module V1
  module Aire
    class AirQualitiesController < V1::BaseController

      def index

        if Airs.air_qualities_does_not_exist?
          Airs.set_air_quality("http://148.243.232.110/xml/app/appcalidadaire.XML")
        end
        render json: Airs.get_air_quality
      end

      private

      def air_quality_params
        params.require(:air_quality).permit(:title, :link, :description, :reporte, :imagenclima, :gradosclima, :calairuser, :colairuser, :iconairuser, :colairno, :calairno, :colairne, :calairne, :colairce, :calairce, :colairso, :calairso, :colairse, :calairse, :imgiuvuser, :caliuvuser, :coliuvuser)
      end
    end
  end
end
