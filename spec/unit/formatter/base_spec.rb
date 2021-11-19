# frozen_string_literal: true

require './lib/formatter/base'

RSpec.describe Formatter::Base do
  subject { described_class.call(tally: tally) }

  let(:tally) do
    {
      '/hello' => 3,
      '/howdy' => 2,
      '/about' => 1,
      '/about/1' => 1
    }
  end

  describe '#call' do
    it 'raises NotImplementedError' do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
