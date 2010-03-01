# Couldn't find class for name Placemaker
# Code Generated by ZenTest v. 4.2.1
#                 classname: asrt / meth =  ratio%
# YahooGeo::Placemaker::Placemark:    0 /    1 =   0.00%

require 'test/unit/testcase'
require 'test/unit' if $0 == __FILE__
require 'shoulda'
require 'placemaker/placemark'

module TestYahooGeo
  module TestPlacemaker
    class TestPlacemark < Test::Unit::TestCase
      context "Given an xml response" do
        setup do
          @xml = open(File.dirname(__FILE__) + '/response.xml')
          @placemark = YahooGeo::Placemaker::Placemark.new(@xml)
        end

        should "have a WOEID of 12763246" do
          assert_equal "12763246", @placemark.woeid
        end

        should 'have a name of "14467, Henrietta, NY, US"' do
          assert_equal "14467, Henrietta, NY, US", @placemark.name
        end

        should "be of type Zip" do
          assert_equal "Zip", @placemark.type
        end
        
        should "have center coords of" do
          assert_equal ["43.0538","-77.5772"], @placemark.center
        end

        should "have southWest coords of" do
          assert_equal ["43.0179","-77.658"], @placemark.south_west
        end

        should "have northEast coords of" do
          assert_equal ["43.0687","-77.5706"], @placemark.north_east
        end
      end
    end
  end
end

# Number of errors detected: 14