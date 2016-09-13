gem 'minitest'
gem 'mocha'

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/unit'
require 'mocha/mini_test'
require './lib/stocks'
require 'pry'

class StocksTest < Minitest::Test

  def test_it_finds_the_best_trade
    best_trade = Stocks.new([10, 7, 5, 8, 11, 9]).find_best_trade
    assert_equal(best_trade, 6)
  end

  def test_it_finds_the_best_trade_high_price_comes_after_lowest_price_first_instance
    best_trade = Stocks.new([1, 2, 3, 4, 5, 6]).find_best_trade
    assert_equal(best_trade, 5)
  end

  def test_it_always_looks_for_a_max_price_after_min_price
    best_trade = Stocks.new([15, 1, 2, 3, 4, 5]).find_best_trade
    assert_equal(best_trade, 4)
  end

  def test_it_always_looks_for_a_max_price_after_min_price_part_II
    best_trade = Stocks.new([15, 1, 1, 1, 1, 3]).find_best_trade
    assert_equal(best_trade, 2)
  end

  def test_it_finds_that_there_is_no_good_trade
    best_trade = Stocks.new([6, 5, 4, 3, 2, 1]).find_best_trade
    assert_equal(best_trade, "No good trades today")
  end

  def test_it_finds_that_there_is_no_good_trade_part_II
    best_trade = Stocks.new([60, 5, 4, 3, 2, 1]).find_best_trade
    assert_equal(best_trade, "No good trades today")
  end
end
