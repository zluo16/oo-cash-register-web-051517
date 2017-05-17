require "pry"

class CashRegister

  attr_accessor :total
  attr_reader :total, :discount

  def initialize(*discount)
    @total = 0
    @cart = []
    @discount = discount[0]
  end

  def add_item(item, price, quantity=1)
    @total += price * quantity

    while quantity > 0
      @cart << item
      quantity -= 1
    end
  end

  def apply_discount
    if self.discount != nil
      @total -= self.total * self.discount / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    @total -= self.total
  end

end
