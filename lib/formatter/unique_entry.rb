# frozen_string_literal: true

require_relative 'base'

module Formatter
  # inherits from base and provides private method for formatting in unique mode
  class UniqueEntry < Base
    private

    def format(route:, count:)
      "#{route} #{count} unique views"
    end
  end
end
