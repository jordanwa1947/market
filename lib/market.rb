
class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendors(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(string_search)
    vendor_inventory = @vendors.group_by do |vendor, items|
      vendor, items
    end
    binding.pry
    vendor_inverntory.select do |vendor|
      vendor_items =~ /#{string_search}/
    end
  end
end
