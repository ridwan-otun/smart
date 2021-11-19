require_relative "base"

module Formatter
    class TotalEntry < Base
        private

        def format(route:, count:)
            "#{route} #{count} visits"
        end
    end
end