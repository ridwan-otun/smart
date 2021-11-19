# frozen_string_literal: true

require 'tempfile'
require './lib/reader/file_reader'

RSpec.describe Reader::FileReader do
  subject { described_class.call(file_path: file_path) }

  let(:tempfile) do
    Tempfile.new('webserver_log').tap do |file|
      lines.each do |line|
        file << "#{line}\n"
      end

      file.close
    end
  end

  let(:lines) do
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
    context 'when file can be found' do
      let(:file_path) { tempfile.path }

      it 'returns an array of all lines from the file' do
        expect(subject).to eq(lines)
      end
    end

    context "when file can't be found" do
      let(:file_path) { '/some/path' }

      it 'raises an error' do
        expect do
          subject
        end.to raise_error('The file path provided does not exist. kindly provide a valid file path')
      end
    end
  end
end
