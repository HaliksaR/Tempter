# frozen_string_literal: true

require_relative '../converter'

module Tempter
  # Fahrenheit converter
  class FahrenheitConverterImpl < Converter
    protected

    def to_celsius(value)
      (value - 32) * 5 / 9
    end

    def to_kelvin(value)
      (value - 32) * 5 / 9 + 273.15
    end

    def to_fahrenheit(value)
      value
    end
  end
end
