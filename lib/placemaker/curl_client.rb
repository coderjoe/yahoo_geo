# Author::    Joseph Bauser
# Copyright:: Copyright (c) 2010 Joseph Bauser
# License::   See LICENSE file
require 'rubygems'
require 'curb'

module YahooGeo
  module Placemaker

    # CurlClient
    #
    # == Overview
    #
    # CurlClient is an alternative client for instances where curl may be more
    # efficient than Net::HTTP
    #
    # == Example
    #
    #   YahooGeo::setup do
    #     placemaker_client YahooGeo::Placemaker::CurlClient
    #   end
    #
    class CurlClient < BaseClient
      def initialize
        @curl = Curl::Easy.new( @placemaker_url )
      end

      # CurlClient.get( latitude, longitude )
      #
      # Perform a request for a Placemark based on a given latitude and longitude
      # 
      # Example:
      #
      # query = YahooGeo::Placemaker::Query.new
      # query.get( 43.0538, -77.5772 ) => #<YahooGeo::Placemaker::Placemark:0x7f5710ce32b8 @woeid="24865670", @south_west=["-46.9005", "-25.3587"], @center=["1", "2"], @name="Africa", @type="Continent", @north_east=["37.5671", "63.5254"]>
      def get( lat, long )
        @curl.http_post(
          Curl::PostField.content( 'appid', YahooGeo::api_key ),
          Curl::PostField.content( 'autoDisambiguate', 'true' ),
          Curl::PostField.content( 'outputType', 'xml' ),
          Curl::PostField.content( 'documentType', 'text/html' ),
          Curl::PostField.content( 'documentContent', "<meta name=\"ICBM\" content=\"#{lat}, #{long}\">" )
        )

        if @curl.response_code != 200 then
          print "Erroring!"
          parse_error( @curl.response_code )
        else
          @curl.body_str
        end
      end

    end

  end
end
