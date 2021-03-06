# frozen_string_literal: true

require_relative 'reader/file_reader'
require_relative 'processor/total_entry'
require_relative 'processor/unique_entry'
require_relative 'formatter/base'
require_relative 'formatter/total_entry'
require_relative 'formatter/unique_entry'
require_relative 'writer/output'

# Parser class that's called from the bin/parser.rb
class Parser
  MODES = {
    total: {
      formatter: Formatter::TotalEntry,
      processor: Processor::TotalEntry
    },
    unique: {
      formatter: Formatter::UniqueEntry,
      processor: Processor::UniqueEntry
    }
  }.freeze
  def self.run(file_path:, mode:)
    chosen_mode = MODES[mode]
    SmartPensionLogger.new(
      file_path: file_path,
      formatter: chosen_mode[:formatter],
      processor: chosen_mode[:processor]
    ).call
  end
end

# this class is responsible for calling the right pipeline on the log file based on the mode chosen
class SmartPensionLogger
  def initialize(file_path:, formatter:, processor:)
    @file_path = file_path
    @formatter = formatter || Formatter::TotalEntry
    @processor = processor || Processor::TotalEntry
    @file_reader = Reader::FileReader
    @writer = Writer::Output
  end

  def call
    read_file
      .then { |entries| process(entries: entries) }
      .then { |tally| format(tally: tally) }
      .then { |output| write(output: output) }
  end

  def read_file
    @file_reader.call(file_path: @file_path)
  end

  def process(entries:)
    @processor.call(entries: entries)
  end

  def format(tally:)
    @formatter.call(tally: tally)
  end

  def write(output:)
    @writer.call(output: output)
  end
end
