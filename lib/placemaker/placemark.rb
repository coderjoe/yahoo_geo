# = placemark.rb - Yahoo! Geo Placemaker Placemark object
#
# Copyright &copy; 2010 Joseph Bauser
#

require 'rubygems'
require 'hpricot'

module YahooGeo
  module Placemaker

    # == Overview
    #
    # A placemark is a parsed Placemaker response including the
    # place's WOEID, type, name, and place bounding rectangle
    #
    # == Example
    #
    #   query = YahooGeo::Placemaker::Query.new
    #   placemark = query.get( 43.0538, -77.5772 )
    #
    #   placemark.woeid => "12589339"
    #   placemark.type => "Zip"
    #   placemark.name => "14467, Henrietta, NY, US"
    #   placemark.center => [ "43.0538", "-77.5772" ]
    #   placemark.south_west => [ "43.0179", "-77.658" ]
    #   placemark.north_east => [ "43.0687", "-77.5706" ]
    class Placemark
      attr_accessor :response, :woeid, :type, :name
      attr_accessor :center, :south_west, :north_east

      # Placemark.new( xmlResponse )
      #
      # Create a new placemark given a successful response from a Placemaker query
      def initialize( xml )
        doc = Hpricot.XML( xml )

        @woeid = doc.at('geographicScope/woeId').inner_text
        @type = doc.at('geographicScope/type').inner_text
        @name = doc.at('geographicScope/name').inner_text

        @center = [doc.at('extents/center/latitude').inner_text,
                   doc.at('extents/center/longitude').inner_text]

        @south_west = [doc.at('extents/southWest/latitude').inner_text,
                       doc.at('extents/southWest/longitude').inner_text]

        @north_east = [doc.at('extents/northEast/latitude').inner_text,
                       doc.at('extents/northEast/longitude').inner_text]
      end
    end

  end
end
