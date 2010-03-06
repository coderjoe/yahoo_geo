# Author::    Joseph Bauser
# Copyright:: Copyright (c) 2010 Joseph Bauser
# License::   See LICENSE file
module YahooGeo
  module Placemaker

    # Query
    #
    # The query class wraps the creation of a client and the
    # parsing of a response into a Placemark into a convenient
    # little package.
    #
    # The bulk of the interaction will happen through the Query#get method
    class Query
      def initialize
        @client = YahooGeo::placemaker_client.new
      end

      # Query.get( latitude, longitude )
      #
      # Return a Placemark object for a given latitude and longitude
      #
      # == Example
      #
      #   query = YahooGeo::Placemaker::Query.new
      #   query.get( 43.0538, -77.5772 ) => #<YahooGeo::Placemaker::Placemark:0x7f5710ce32b8 @woeid="24865670", @south_west=["-46.9005", "-25.3587"], @center=["1", "2"], @name="Africa", @type="Continent", @north_east=["37.5671", "63.5254"]>
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
