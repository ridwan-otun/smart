module Processor
    class TotalEntry
        def self.call(entries:)
            new.call(entries: entries)
        end

        def call(entries:)
            routes = []

            entries.each do |entry|
                entry_to_array = entry.split(" ")
                routes << entry_to_array[0]
            end
            
            routes.tally
        end
    end
end