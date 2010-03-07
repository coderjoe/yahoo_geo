require 'helper'

module TestYahooGeo
  class TestYahooGeo < Test::Unit::TestCase
    context "In order to configure YahooGeo" do
      setup do
        YahooGeo::setup do
          api_key 'my_long_api_key'
          placemaker_client YahooGeo::Placemaker::NetHTTPClient
        end
      end

      should "have an api_key of 'my_long_api_key'" do
        assert_equal YahooGeo::api_key, 'my_long_api_key'
      end

      should "have a placemaker_client of YahooGeo::Placemaker::NetHTTPClient" do
        assert_equal YahooGeo::placemaker_client, YahooGeo::Placemaker::NetHTTPClient
      end
    end
  end
end
