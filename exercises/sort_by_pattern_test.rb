gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class SortByPatternTest < Minitest::Test

  def test_sort_alphabetically
    words = ["broccoli", "Carrots", "FISH", "Bacon", "candy"]
    transformed = []
    words.each do |word|
      transformed << [word.downcase, word]
    end
    transformed = transformed.sort
    sorted = []
    transformed.each do |sort_key, word|
      sorted << word
    end
    assert_equal ["Bacon", "broccoli", "candy", "Carrots", "FISH"], sorted
  end

  def test_sort_alphabetically_by_last_letter
    things = ["pill", "box", "glass", "water", "sponge"]
    transformed = []
    things.each do |thing|
      transformed << [thing.downcase[-1], thing]
    end
    transformed = transformed.sort
    sorted = []
    transformed.each do |sort_key, thing|
      sorted << thing
    end
    assert_equal ["sponge", "pill", "water", "glass", "box"], sorted
  end

  def test_sort_by_distance
    distances = ["1cm", "9cm", "30cm", "4cm", "2cm"]
    transformed = []
    distances.each do |distance|
			sort_key = distance.split("")
			sort_key.pop(2)
			transformed << [sort_key.join.to_i, distance]
		end
    transformed = transformed.sort
    sorted = []
    transformed.each do |sort_key, distance|
      sorted << distance
    end
    assert_equal ["1cm", "2cm", "4cm", "9cm", "30cm"], sorted
  end

  def test_sort_by_length
    words = ["heteromorph", "ancyloceratina", "bioengineering", "mathematical", "bug"]
    transformed = []
		words.each do |word|
			transformed << [word.length, word]
		end
		transformed = transformed.sort
		sorted = []
		transformed.each do |sort_key, word|
			sorted << word
		end
    assert_equal ["bug", "heteromorph", "mathematical", "ancyloceratina", "bioengineering"], sorted
  end

  def test_sort_by_proximity_to_ten
    prices = [3.02, 9.91, 17.9, 10.01, 11.0]
    transformed = []
		prices.each do |price|
			transformed << [(price - 10).abs, price ]
		end
		transformed = transformed.sort
		sorted = []
		transformed.each do |sort_key, price|
			sorted << price
		end
    assert_equal [10.01, 9.91, 11.0, 3.02, 17.9], sorted
  end

  def test_sort_by_number_of_cents
    prices = [3.02, 9.91, 7.9, 10.01, 11.0]
    transformed = []
		prices.each do |price|
			transformed << [(price*100).to_i.to_s[-2..-1], price]
		end
		transformed = transformed.sort
		sorted = []
		transformed.each do |sort_key, price|
			sorted << price
		end
    assert_equal [11.0, 10.01, 3.02, 7.9, 9.91], sorted
  end

end