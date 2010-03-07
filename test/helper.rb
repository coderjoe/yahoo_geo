require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'fakeweb'
require 'fakeweb_helpers'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'yahoo_geo'

class Test::Unit::TestCase
end
