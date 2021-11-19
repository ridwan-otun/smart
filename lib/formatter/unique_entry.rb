require_relative "base"

module Formatter
    class UniqueEntry < Base
        private

        def format(route:, count:)
            "#{route} #{count} unique views"
        end
    end
end