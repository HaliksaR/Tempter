# frozen_string_literal: true

require 'tempter/version'
require 'tempter/converter_builder'


# Tempter convert temperature lib
module Tempter

  # Tempter convert temperature root app
  class App

    PATTERN_REGEX_INPUT = /^[+-]?\d+\s*\d+(?:\.\d+)?[CcFfKk]\s*=>\s*[CcFfKk]/.freeze
    PATTERN_REGEX_TEMPERATURE = /^[+-]?\d+\s*\d+(?:\.\d+)?/.freeze
    PATTERN_REGEX_TYPE = /[CcFfKk]/.freeze
    PATTERN_REGEX_TO_TYPE = /[CcFfKk]\Z/.freeze

    def show_help
      puts "<Float||Int>F => C\n temperature | type => convert type"
      puts "\tTYPES:\n\t F - fahrenheit \n\t C - celsius \n\t K - kelvin"
    end

    # @param [String] input
    def parse_input(input)
      raise 'Invalid Input' unless input.match?(PATTERN_REGEX_INPUT)

      @builder = ConverterBuilder.new
                     .attr_temperature(input[PATTERN_REGEX_TEMPERATURE].to_f)
                     .attr_type(input.match(PATTERN_REGEX_TYPE).to_s)
                     .attr_to_type(input.match(PATTERN_REGEX_TO_TYPE).to_s)
                     .discover_converter
      self
    end

    # @return [Float]
    def take_convert_temperature
      @builder.convert
    end
  end
end
