# frozen_string_literal: true

require 'test_helper'

class ConverterTest < Minitest::Test

  def test_c_to_f
    request = Tempter::ConverterBuilder.new
                  .attr_temperature('+32')
                  .attr_type('C')
                  .attr_to_type('F')
                  .discover_converter
                  .convert
    assert_equal(request.round(2), 89.6)
  end

  def test_c_to_k
    request = Tempter::ConverterBuilder.new
                  .attr_temperature('+32')
                  .attr_type('C')
                  .attr_to_type('K')
                  .discover_converter
                  .convert
    assert_equal(request.round(2), 305.15)
  end

  def test_f_to_c
    request = Tempter::ConverterBuilder.new
                  .attr_temperature('+32')
                  .attr_type('f')
                  .attr_to_type('c')
                  .discover_converter
                  .convert
    assert_equal(request.round(2), 0)
  end

  def test_f_to_k
    request = Tempter::ConverterBuilder.new
                  .attr_temperature('+32')
                  .attr_type('f')
                  .attr_to_type('k')
                  .discover_converter
                  .convert
    assert_equal(request.round(2), 273.15)
  end

  def test_k_to_c
    request = Tempter::ConverterBuilder.new
                  .attr_temperature('+32')
                  .attr_type('k')
                  .attr_to_type('c')
                  .discover_converter
                  .convert
    assert_equal(request.round(2), -241.15)
  end

  def test_k
    request = Tempter::ConverterBuilder.new
                  .attr_temperature('+32')
                  .attr_type('k')
                  .attr_to_type('f')
                  .discover_converter
                  .convert
    assert_equal(request.round(2), -402.07)
  end

  def test_k_to_k
    request = Tempter::ConverterBuilder.new
                  .attr_temperature('+32')
                  .attr_type('k')
                  .attr_to_type('k')
                  .discover_converter
                  .convert
    assert_equal(request.round(2), 32)
  end
end
