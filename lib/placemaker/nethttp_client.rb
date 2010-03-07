# Author::    Joseph Bauser
# Copyright:: Copyright (c) 2010 Joseph Bauser
# License::   See LICENSE file
require 'rubygems'
require 'net/http'
require 'uri'

module YahooGeo
  module Placemaker

    # NetHTTPClient
    #           
    # == Overview
    #
    # NetHTTPClient is the default HTTP Request client for YahooGeo::Placemark
    #
    # == Example
    #
    #   # This entirely unnecessary since NetHTTPClient is the default!
    #   YahooGeo::setup do
    #     placemaker_client YahooGeo::Placemaker::NetHTTPClient
    #   end
    class NetHTTPClient < BaseClient

      # NetHTTPClient.get( latitude, longitude )
      #
      # Perform a request for a Placemark based on a given latitude and longitude
      #
      # Example:
      #
      # query = YahooGeo::Placemaker::Query.new
      # query.get( 43.0538, -77.5772 ) => #<YahooGeo::Placemaker::Placemark:0x7f5710ce32b8 @woeid="24865670", @south_west=["-46.9005", "-25.3587"], @center=["1", "2"], @name="Africa", @type="Continent", @north_east=["37.5671", "63.5254"]>
      def get( lat, long )
        url = URI.parse( @placemaker_url )
        response = Net::HTTP.post_form( url , {
          'appid' => YahooGeo::api_key,
          'autoDisambiguate' => 'true',
          'outputType' => 'xml',
          'documentType' => 'text/html',
          'documentContent' => "<meta name=\"ICBM\" content=\"#{lat}, #{long}\">"
        })

        if response.code != '200' then
          parse_error( response.code )
        else
          response.body
        end
      end

    end

  end
end
