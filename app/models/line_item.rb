class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order
  
  def total_price
    product.price * quantity
  end
  
  def decrement
    if self.quantity > 1 
      self.quantity -= 1
      self.save
    else
      self.destroy
    end
    self
  end
end