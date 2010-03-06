require 'rubygems'
require 'net/http'
require 'uri'

module YahooGeo
  module Placemaker

    class NetHTTPClient < BaseClient
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
          print "Error! #{response.code}"
          parse_error( response.code )
        else
          response.body
        end
      end

    end

  end
end
