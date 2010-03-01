module YahooGeo
  module Placemaker
    class MockClient
      def initialize( file_name )
        @file = file_name
      end

      def get( lat, long )
        open(@file)
      end
    end
  end
end
