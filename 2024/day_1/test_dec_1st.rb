require "minitest/autorun"
require_relative "dec_1st"

class TestDec1st < Minitest::Test
  def setup
    @test_file = "test_input.txt"
  end

  def test_total_distance_calc
    assert_equal 11, total_distance_calc(@test_file)
  end

  def test_similarity_calc
    assert_equal 31, similarity_calc(@test_file)
  end
end