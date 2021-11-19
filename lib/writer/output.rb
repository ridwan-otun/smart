# frozen_string_literal: true

module Writer
  # handles writing to stdout
  class Output
    def self.call(output:)
      new.call(output: output)
    end

    def call(output:)
      output.each do |visit|
        puts visit.to_s
      end
    end
  end
end
