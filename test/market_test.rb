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
    assert_equal [], market.vendors
  end

  def test_market_can_add_vendors
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_3 = Vendor.new("Palisade Peach Shack")

    market.add_vendors(vendor_1)
    market.add_vendors(vendor_2)
    market.add_vendors(vendor_3)

    expected = market.vendors.all? { |vendor| vendor.class == Vendor}

    assert expected
    assert_equal 3, market.vendors.count
  end

  def test_that_market_can_give_an_array_of_names
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_3 = Vendor.new("Palisade Peach Shack")

    market.add_vendors(vendor_1)
    market.add_vendors(vendor_2)
    market.add_vendors(vendor_3)

    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected, market.vendor_names
  end

  def test_that_market_can_search_for_vendors_who_sell_certain_items
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_3 = Vendor.new("Palisade Peach Shack")

    market.add_vendors(vendor_1)
    market.add_vendors(vendor_2)
    market.add_vendors(vendor_3)

    vendor_1.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3.stock("Peaches", 65)

    assert_equal [vendor_2, vendor_3], market.vendors_that_sell('Peaches')
    assert_equal [vendor_1], market.vendors_that_sell('Peaches')
  end
end
