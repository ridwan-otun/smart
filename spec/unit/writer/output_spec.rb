# frozen_string_literal: true

require './lib/writer/output'

RSpec.describe Writer::Output do
  subject { described_class.call(output: outputs) }

  let(:outputs) do
    [
      'first line',
      'second line'
    ]
  end

  describe '#call' do
    it 'writes to standard output' do
      expect { subject }.to output(
        "first line\nsecond line\n"
      ).to_stdout
    end
  end
end
