require 'rubygems'
require 'curb'

module YahooGeo
  module Placemaker

    class CurlClient < BaseClient
      def initialize
        @curl = Curl::Easy.new( @placemaker_url )
      end

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
