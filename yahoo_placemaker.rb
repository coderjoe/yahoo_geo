require 'rubygems'
require 'curb'
require 'hpricot'

module Yahoo
  API_KEY = 'fPR4YN7V34H6ywhqeSU0scmBtegKO9MQ9.kF42ysDyeJIvZfAQV2zRJH6LUerKRFhYUpyQ--'
end

module Yahoo
  module Placemaker
    class CurlClient
      def initialize( apiKey )
        @api_key = apiKey
        @curl = Curl::Easy.new('http://wherein.yahooapis.com/v1/document')
      end

      def get( lat, long )
        @curl.http_post(
          Curl::PostField.content( 'appid', @api_key ),
          Curl::PostField.content( 'autoDisambiguate', 'true' ),
          Curl::PostField.content( 'outputType', 'xml' ),
          Curl::PostField.content( 'documentType', 'text/html' ),
          Curl::PostField.content( 'documentContent', "<meta name=\"ICBM\" content=\"#{lat}, #{long}\">" )
        )
      
        Hpricot.XML( @curl.body_str )
      end
    end

    class Point
      attr_accessor :lat, :long

      def initialize( doc )
        @lat = doc.at('latitude').inner_html
        @long = doc.at('longitude').inner_html
      end
    end

    class Placemark
      attr_accessor :response, :woeid, :type, :name
      attr_accessor :center, :south_west, :north_east

      def initialize( doc )
        @response = doc
        @woeid = doc.at( 'geographicScope/woeId' )
        @type = doc.at('geographicScope/type').inner_html
        @name = doc.at('geographicScope/name').inner_html
        @center = Point.new( doc.at('extents/center') )
        @south_west = Point.new( doc.at('extents/southWest') )
        @north_east = Point.new( doc.at('extents/northEast') )
      end
    end

    class Base
      def initialize( api_key )
        @api_key = api_key || API_KEY
        @curl = CurlClient.new( @api_key )
      end

      def get( lat, long )
        response = @curl.get( lat, long )
        Placemark.new(response)
      end
    end 
  end
end
