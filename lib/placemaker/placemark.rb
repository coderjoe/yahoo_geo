require 'rubygems'
require 'hpricot'

module YahooGeo
  module Placemaker

    class Placemark
      attr_accessor :response, :woeid, :type, :name
      attr_accessor :center, :south_west, :north_east

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
