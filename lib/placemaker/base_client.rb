module YahooGeo
  module Placemaker
    class BaseClient
      def initialize
        @placemaker_url = 'http://wherein.yahooapis.com/v1/document'
      end

      private
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

