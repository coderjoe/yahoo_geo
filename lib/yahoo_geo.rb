API_KEY = 'fPR4YN7V34H6ywhqeSU0scmBtegKO9MQ9.kF42ysDyeJIvZfAQV2zRJH6LUerKRFhYUpyQ--'

module YahooGeo
  class << self
    attr_accessor :api_key
  end
end

YahooGeo.api_key = API_KEY

require 'placemaker/placemaker'
