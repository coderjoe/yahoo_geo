module YahooGeo
  module Placemaker
    class FileClient
      def initialize( file )
        @file = file
      end

      def get( *args )
        open( @file )
      end
    end
  end
end
