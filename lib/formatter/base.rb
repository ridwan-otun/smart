# frozen_string_literal: true

module Formatter
  # module to format the entries processed from the logs and arrange them.
  class Base
    def self.call(tally:)
      new.call(tally: tally)
    end

    def call(tally:)
      tally_array = tally.sort_by { |_route, count| -count }
      tally_array.map do |tally_entry|
        route = tally_entry[0]
        count = tally_entry[1]
        format(route: route, count: count)
      end
    end

    private

    def format(route:, count:)
      raise NotImplementedError
    end
  end
end
