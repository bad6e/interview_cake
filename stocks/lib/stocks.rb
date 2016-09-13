require 'pry'

class Stocks

  attr_accessor :stock_prices,
                :max_price,
                :min_price,
                :max_price_index,
                :min_price_index


  def initialize(stocks_prices)
    @stock_prices    = stocks_prices
    @max_price       = stock_prices.max
    @min_price       = stock_prices.min
    @max_price_index = stock_prices.index(max_price)
    @min_price_index = stock_prices.index(min_price)
  end

  def find_best_trade
    if max_price_index > min_price_index
      max_price - min_price
    else
      find_max_price_after_min
    end
  end

  private

  def find_max_price_after_min
    prices_after_min_price  = stock_prices[min_price_index..-1]
    max_price_in_new_prices = prices_after_min_price.max
    if prices_after_min_price.length === 1
      "No good trades today"
    else
      max_price_in_new_prices - min_price
    end
  end
end
