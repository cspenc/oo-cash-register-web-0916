require "pry"
class CashRegister
  attr_accessor :discount, :total, :last

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    quantity.times { @items << item }
    @last = price * quantity
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    self.total -= @total * @discount/100
    "After the discount, the total comes to $#{total}."
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= @last
    @items.pop
  end

end
