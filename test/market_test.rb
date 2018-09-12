require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'

class MarketTest < Minitest::Test

  def test_it_exits
    market = Market.new("South Pearl Street Farmers Market")

    assert_instance_of Market, market
  end

  def test_that_it_has_attributes
    market = Market.new("South Pearl Street Farmers Market")

    assert_equal "South Pearl Street Farmers Market", market.name
  end
end
