module Formatter
    class Base
        def self.call(tally:)
            new.call(tally: tally)
        end

        def call(tally:)
            tally_array = tally.sort_by {|route, count| -count}
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