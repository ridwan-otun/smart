# frozen_string_literal: true

require './lib/processor/total_entry'

RSpec.describe Processor::TotalEntry do
  subject { described_class.call(entries: entries) }

  let(:entries) do
    [
      '/hello 123.456.789',
      '/howdy 134.234.567',
      '/about 123.456.789',
      '/about/1 123.879.234',
      '/hello 123.456.789',
      '/hello 123.456.780'
    ]
  end

  describe '#call' do
    it 'returns a hash of routes and their frequency' do
      expect(subject).to eq(
        '/hello' => 3,
        '/howdy' => 1,
        '/about' => 1,
        '/about/1' => 1
      )
    end
  end
end
