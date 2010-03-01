require 'rubygems'
require 'curb'

module YahooGeo
  module Placemaker

    class CurlClient
      def initialize
        @curl = Curl::Easy.new('http://wherein.yahooapis.com/v1/document')
      end

      def get( lat, long )
        @curl.http_post(
          Curl::PostField.content( 'appid', YahooGeo::api_key ),
          Curl::PostField.content( 'autoDisambiguate', 'true' ),
          Curl::PostField.content( 'outputType', 'xml' ),
          Curl::PostField.content( 'documentType', 'text/html' ),
          Curl::PostField.content( 'documentContent', "<meta name=\"ICBM\" content=\"#{lat}, #{long}\">" )
        )
      
        @curl.body_str
      end
    end

  end
end
