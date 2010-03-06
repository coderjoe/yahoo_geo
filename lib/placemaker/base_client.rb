# Author::    Joseph Bauser
# Copyright:: Copyright (c) 2010 Joseph Bauser
# License::   See LICENSE file
module YahooGeo
  module Placemaker

    # == Overview
    #
    # Base client provides URL information and error code handling for all other clients
    class BaseClient
      private
      def initialize
        @placemaker_url = 'http://wherein.yahooapis.com/v1/document'
      end

      # parse_error( code )
      #
      # Given a HTTP response code, raise the correct YahooGeo error
      def parse_error( code )
        raise case code.to_i
              when 400 then YahooGeo::BadRequestError
              when 404 then YahooGeo::NotFoundError
              when 413 then YahooGeo::RequestTooLargeError
              when 415 then YahooGeo::UnsupportedMediaTypeError
              when 999 then YahooGeo::RateLimitError
              else YahooGeo::UnknownError
              end
      end
    end
  end
end
