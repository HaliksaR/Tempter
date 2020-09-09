# frozen_string_literal: true

require_relative 'converters/impl/kelvin_converter_impl'
require_relative 'converters/impl/celsius_converter_impl'
require_relative 'converters/impl/fahrenheit_converter_impl'

module Tempter
  # Converter Builder temperature
  class ConverterBuilder

    attr_reader :temperature

    # @param [Float] temperature
    # @return [Tempter::Converter::ConverterBuilder]
    def attr_temperature(temperature)
      @temperature = temperature
      self
    end

    # @param [String?] type
    # @return [Tempter::Converter::ConverterBuilder]
    def attr_type(type)
      @type = type
      self
    end

    # @param [String?] to_type
    # @return [Tempter::Converter::ConverterBuilder]
    def attr_to_type(to_type)
      @to_type = to_type
      self
    end

    # @return [Float]
    def convert
      case @to_type
      when 'F', 'f'
        convert_to(Converter::TO_FAHRENHEIT)
      when 'C', 'c'
        convert_to(Converter::TO_CELSIUS)
      when 'K', 'k'
        convert_to(Converter::TO_KELVIN)
      else
        raise "This #{type} not fount"
      end
    end

    # @return [Tempter::Converter::ConverterBuilder]
    def discover_converter
      case @type
      when 'F', 'f'
        @converter = Tempter::FahrenheitConverterImpl.new
      when 'C', 'c'
        @converter = Tempter::CelsiusConverterImpl.new
      when 'K', 'k'
        @converter = Tempter::KelvinConverterImpl.new
      else
        raise "This #{@type} not fount"
      end
      self
    end

    # @param [String] type_convert - type converter
    def convert_to(type_convert)
      @converter.convert(@temperature, type_convert)
    end
  end
end
