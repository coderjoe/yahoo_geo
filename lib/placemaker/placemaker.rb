module YahooGeo
  module Placemaker
    class Query
      def initialize
        @client = YahooGeo::placemaker_client.new
      end

      def get( lat, long )
        xml = @client.get( lat, long)
        Placemark.new( xml )
      end
    end

  end
end

require 'placemaker/errors'
require 'placemaker/base_client'
require 'placemaker/nethttp_client'
require 'placemaker/curl_client'
require 'placemaker/placemark'
