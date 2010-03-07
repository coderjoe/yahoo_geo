# Author::    Joseph Bauser
# Copyright:: Copyright (c) 2010 Joseph Bauser
# License::   See LICENSE file
#
# == Overview
#
# YahooGeo is a library providing basic access to the Yahoo Geo APIs.
# For more information about Yahoo!'s Geo Techologies visit http://developer.yahoo.com/geo/
#
# == Configure YahooGeo
#
# Configuration of the YahooGeo library is done through the Yahoogeo setup block
#
# === Examples
#
#   YahooGeo::setup do
#     api_key 'YOUR_API_KEY_HERE'
#     placemaker_client YahooGeo::Placemaker::NetHTTPClient
#   end
module YahooGeo
  class << self
    attr_writer :api_key, :placemaker_client

    # placemaker_client Yahoo::Placemaker::CurlClient
    #
    # Set the client for YahooGeo::Placemaker::Query to use
    # Default: YahooGeo::Placemaker::NetHTTPClient
    def placemaker_client(c=nil)
      @client = c unless c.nil?
      @client
    end

    # api_key 'API_KEY_HERE'
    #
    # Set the Yahoo! API key
    def api_key(a=nil)
      @api_key = a unless a.nil?
      @api_key
    end

    # Configure YahooGeo's information
    #
    # YahooGeo::setup do
    #   api_key 'API_KEY_HERE'
    #   placemaker_client YahooGeo::Placemaker::CurlClient
    # end
    def setup(&block)
      instance_eval( &block )
    end
  end
end

require 'placemaker/placemaker'

YahooGeo::setup do
  placemaker_client YahooGeo::Placemaker::NetHTTPClient
end
