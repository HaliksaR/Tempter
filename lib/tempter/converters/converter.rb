# frozen_string_literal: true

module Tempter

  # Base api for converters
  class Converter

    TO_CELSIUS = 'to Celsius'
    TO_FAHRENHEIT = 'to Fahrenheit'
    TO_KELVIN = 'to Kelvin'

    # @param [Float] value - temperature value
    # @param [String] type_convert - type converter
    # @return [Float] temperature convert
    def convert(value, type_convert)
      case type_convert
      when TO_CELSIUS
        to_celsius(value)
      when TO_FAHRENHEIT
        to_fahrenheit(value)
      when TO_KELVIN
        to_kelvin(value)
      else
        raise "This #{type_convert} not fount"
      end
    end

    protected

    # @param [Float] _value - temperature value
    # @return [Float] temperature convert to fahrenheit
    def to_fahrenheit(_value)
      raise 'Not Impl'
    end

    # @param [Float] _value - temperature value
    # @return [Float] temperature convert to kelvin
    def to_kelvin(_value)
      raise 'Not Impl'
    end

    # @param [Float] _value - temperature value
    # @return [Float] temperature convert to celsius
    def to_celsius(_value)
      raise 'Not Impl'
    end
  end
end
