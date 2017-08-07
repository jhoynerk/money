module Arithmetic
  def +(object)
    self.amount = amount + object.convert_to(currency).amount
    self
  end

  def -(object)
    self.amount = amount - object.convert_to(currency).amount
    self
  end

  def /(value)
    self.amount = amount / value
    self
  end

  def *(value)
    self.amount = amount * value
    self
  end

  def ==(object)
    if object.is_a?(self.class)
      self.amount == object.convert_to(currency).amount
    end
  end

  def <(object)
    self.amount < object.convert_to(currency).amount
  end

  def >(object)
    self.amount > object.convert_to(currency).amount
  end
end
