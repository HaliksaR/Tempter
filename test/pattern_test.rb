# frozen_string_literal: true

require 'test_helper'

class PatternTest < Minitest::Test
  def test_pattern_input
    ['+12.34F => C', '+1234f => K', '-1234C=>k', '1234C =>     K'].each do |item|
      assert item.match?(::Tempter::App::PATTERN_REGEX_INPUT)
    end
    ['+12.34F => A', '+12.34F  A', '+12F4F  A'].each do |item|
      assert !item.match?(::Tempter::App::PATTERN_REGEX_INPUT)
    end
  end

  def test_pattern_temperature
    ['+12.34F => A', '+12.34F  A', '+12F4F  A'].each do |item|
      assert item.match?(::Tempter::App::PATTERN_REGEX_TEMPERATURE)
    end
  end

  def test_pattern_type
    %w[+12.34F +12.34c +12F4a].each do |item|
      assert item.match?(::Tempter::App::PATTERN_REGEX_TYPE)
    end
  end

  def test_pattern_to_type
    ['+12.34F G', '+12.34c H', '+12F4a R'].each do |item|
      assert !item.match?(::Tempter::App::PATTERN_REGEX_TO_TYPE)
    end
  end
end
