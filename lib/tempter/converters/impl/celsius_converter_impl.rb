# frozen_string_literal: true

require_relative '../converter'

module Tempter
  # Celsius converter
  class CelsiusConverterImpl < Converter

    protected

    def to_celsius(value)
      value
    end

    def to_kelvin(value)
      value + 273.15
    end

    def to_fahrenheit(value)
      (value * 9 / 5) + 32
    end
  end
end

