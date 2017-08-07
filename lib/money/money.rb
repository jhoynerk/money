class Money
  extend Configuration
  include Arithmetic
  attr_accessor :amount, :currency, :inspect
  DECIMAL = 2

  def initialize(amount, currency)
    self.amount = amount
    self.currency = currency
  end

  def inspect
    "#{float_amount} #{currency}"
  end

  def convert_to(currency)
    if currency == self.currency
      return self
    elsif currency_present?(currency) || currency == default_currency
      return self.class.new( convert_amount(currency), currency)
    end
    false
  end

  private

    def conversions
      self.class.configuration.conversions
    end

    def default_currency
      self.class.configuration.default_currency
    end

    def currency_present?(currency)
      conversions.has_key? currency
    end

    def convert_amount(currency)
      if currency == default_currency
        amount / conversions[self.currency]
      else
        amount * conversions[currency]
      end
    end

    def float_amount
      "%.#{Money::DECIMAL}f" % amount
    end
end
