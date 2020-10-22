# frozen_string_literal: true

require_relative '../converter'

module Tempter
  # Kelvin converter
  class KelvinConverterImpl < Converter
    protected

    def to_celsius(value)
      value - 273.15
    end

    def to_kelvin(value)
      value
    end

    def to_fahrenheit(value)
      (value - 273.15) * 9 / 5 + 32
    end
  end
end
