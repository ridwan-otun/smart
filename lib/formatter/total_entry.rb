# frozen_string_literal: true

require_relative 'base'

module Formatter
  # inherits from base and provides private method for formatting in total mode
  class TotalEntry < Base
    private

    def format(route:, count:)
      "#{route} #{count} visits"
    end
  end
end
