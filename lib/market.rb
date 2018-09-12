
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
    @vendors.select do |vendor|
      vendor.inventory.any? do |item|
        item[0] =~ /#{string_search}/
      end
    end
  end

  def total_inventory
    @vendors.group_by do |sum, item_total|
      vendor.stock()
    end
  end

  def sorted_item_list
    all_items = @vendors.reduce(0) do |vendor|
      add_vendor
    end
    all_items.flatten.uniq.sort
  end
end
