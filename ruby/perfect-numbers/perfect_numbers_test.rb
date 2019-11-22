require 'minitest/autorun'
require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect_28
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_perfect_6
    assert_equal 'perfect', PerfectNumber.classify(6)
  end

  def test_classify_perfect_496
    assert_equal 'perfect', PerfectNumber.classify(496)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end
