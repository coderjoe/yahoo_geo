API_KEY = 'fPR4YN7V34H6ywhqeSU0scmBtegKO9MQ9.kF42ysDyeJIvZfAQV2zRJH6LUerKRFhYUpyQ--'

module YahooGeo
  class << self
    attr_writer :api_key, :placemaker_client

    def placemaker_client(c=nil)
      @client = c unless c.nil?
      @client
    end

    def api_key(a=nil)
      @client = a unless a.nil?
      @client
    end

    def setup(&block)
      instance_eval( &block )
    end
  end
end

require 'placemaker/placemaker'

YahooGeo::setup do
  placemaker_client YahooGeo::Placemaker::CurlClient
end
