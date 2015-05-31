gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'objects/thing'
require_relative 'objects/unicorn'
require_relative 'objects/gnome'
require_relative 'objects/squid'

class BonusQuestionsTest < Minitest::Test
  def test_7_factorial
    # Example: "Five factorial", written 5!, is
    # 1 * 2 * 3 * 4 * 5
    product = 1
    numbers = [1, 2, 3, 4, 5, 6, 7]
    numbers.each do |number|
      product *= number
    end
    assert_equal 5040, product
  end

  def test_first_roving_gnome
    gnome1 = Gnome.new('forest')
    gnome2 = Gnome.new('roving')
    gnome3 = Gnome.new('snorkeling')
    gnome4 = Gnome.new('evil')
    gnome5 = Gnome.new('roving')

    gnomes = [gnome1, gnome2, gnome3, gnome4, gnome5]

    found = gnomes.find do |gnome|
			gnome.roving?
		end

    assert_equal gnome2, found
  end

	def test_sum_of_factorials
		sum_of_factorials = 0
		numbers = [1, 2, 3, 4, 5]
		sum_of_factorials = numbers.reduce(0) do |sum, number|
			sum + number.downto(1).reduce(:*)
		end
		assert_equal 153, sum_of_factorials
	end

	def test_first_giant_squid
		squid1 = Squid.new('tiny')
		squid2 = Squid.new('inky')
		squid3 = Squid.new('giant')
    squid4 = Squid.new('deep sea')
    squid5 = Squid.new('giant')

    squiddies = [squid1, squid2, squid3, squid4, squid5]

    found = squiddies.find do |squid|
			squid.giant?
		end

    assert_equal squid3, found
  end

  def test_max_value
    max_num = 0
    numbers = [2, 16, 6, 50, 12]
    max_num = numbers.max
    assert_equal 50, max_num
  end

  def test_first_weird_thing_using_find
    thing1 = Thing.new('odd')
    thing2 = Thing.new('cool')
    thing3 = Thing.new('weird')
    thing4 = Thing.new('fun')
    thing5 = Thing.new('weird')

    things = [thing1, thing2, thing3, thing4, thing5]

    found = things.find do |thing|
			thing.weird?
		end

    assert_equal thing3, found
  end

  def test_first_pink_unicorn
    unicorn1 = Unicorn.new('white')
    unicorn2 = Unicorn.new('sparkly')
    unicorn3 = Unicorn.new('purple')
    unicorn4 = Unicorn.new('pink')
    unicorn5 = Unicorn.new('pink')

    unicorns = [unicorn1, unicorn2, unicorn3, unicorn4, unicorn5]

    found = unicorns.find do |unicorn|
			unicorn.pink?
		end

    assert_equal unicorn4, found
  end
end

