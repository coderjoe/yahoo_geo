require 'helper'

module TestYahooGeo
  module TestPlacemaker
    class TestQuery < Test::Unit::TestCase
      
      LAT = 43.0538
      LONG = -77.5772
      
      def register_uri( options )
        FakeWeb.clean_registry
        FakeWeb.register_uri(:post, 'http://wherein.yahooapis.com/v1/document', options )
      end

      def self.should_throw_for( exception, code )
        instance_eval do
          should "throw #{exception} for #{code[0]} #{code[1]}" do
            register_uri( :status => code )
            assert_raise exception do
              @query.get( LAT, LONG )
            end
          end

          should "properly set the response #{exception} code to #{code[0]} and message tp #{code[1]}" do
            begin
              @query.get( LAT, LONG )
            rescue YahooGeo::Error => error
              assert_equal code[0], error.code
              assert_equal code[1], error.message
            end
          end
        end
      end

      context "A valid query object" do
        setup do
          @query = YahooGeo::Placemaker::Query.new
        end

        should "return a valid response for 200" do
          register_uri( :response => 'test/response.curl' )
          r = @query.get( LAT, LONG )
          assert_not_nil r
        end

        should_throw_for YahooGeo::NotFoundError, [404, 'Not Found']
        should_throw_for YahooGeo::BadRequestError, [400, 'Bad Request']
        should_throw_for YahooGeo::RequestTooLargeError, [413, 'Request Too Large']
        should_throw_for YahooGeo::UnsupportedMediaTypeError, [415, 'Unsupported Media Type']
        should_throw_for YahooGeo::RateLimitError, [999, 'Rate Limited']
        should_throw_for YahooGeo::UnknownError, [31337, 'Wtf? This is not a real code!']
      end

    end
  end
end
