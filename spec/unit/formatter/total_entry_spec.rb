# frozen_string_literal: true

require './lib/formatter/total_entry'

RSpec.describe Formatter::TotalEntry do
  subject { described_class.call(tally: tally) }

  let(:tally) do
    {
      '/hello' => 3,
      '/howdy' => 1,
      '/about' => 1,
      '/about/1' => 1
    }
  end

  describe '#call' do
    it 'returns a formatted representation of routes and their visits' do
      expect(subject).to eq(
        [
          '/hello 3 visits',
          '/howdy 1 visits',
          '/about 1 visits',
          '/about/1 1 visits'
        ]
      )
    end
  end
end
