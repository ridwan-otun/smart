# frozen_string_literal: true

module Processor
  # handles processing of the log entries in unique mode
  class UniqueEntry
    def self.call(entries:)
      new.call(entries: entries)
    end

    def call(entries:)
      full_entries = []

      entries.each do |entry|
        full_entries << entry
      end

      unique_entry = full_entries.uniq.map { |entry| entry.split(' ')[0] }
      unique_entry.tally
    end
  end
end
