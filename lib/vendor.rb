require 'pry'
class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    count = @inventory[item]
    count = 0 if count == nil
    count
  end

  def stock(item, number)
    if  @inventory[item] != nil
      @inventory[item] += number
    else
      @inventory[item] = number 
    end
  end

end
