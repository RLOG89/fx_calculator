require 'bigdecimal'

class FxCalculation

  def calculate_rate(amount, rate_from, rate_to)
    from = BigDecimal.new(rate_from, 5)
    to   = BigDecimal.new(rate_to, 5)
    rate = ((amount / from) * to).round(2)
    return rate.to_s('F')
  end

end