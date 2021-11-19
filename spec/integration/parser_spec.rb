# frozen_string_literal: true

require 'tempfile'
require './lib/parser'

RSpec.describe Parser do
  subject { described_class.run(file_path: file_path, mode: mode) }

  let(:file_path) { tempfile.path }

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
      '/rower 123.456.789',
      '/hello 123.456.789',
      '/about 123.456.789',
      '/about/1 123.879.234',
      '/hello 123.456.789',
      '/hello 123.456.780'
    ]
  end

  describe '#run' do
    context 'total visits in the right order by number of visits' do
      let(:mode) { :total }

      it 'prints of sorted visits of routes' do
        expect { subject }.to output(
          "/hello 3 visits\n" \
              "/rower 1 visits\n" \
              "/about 1 visits\n" \
              "/about/1 1 visits\n"
        ).to_stdout
      end
    end

    context 'unique route views ordered by number of unique views' do
      let(:mode) { :unique }

      it 'prints of sorted visits of routes' do
        expect { subject }.to output(
          "/hello 2 unique views\n" \
            "/rower 1 unique views\n" \
            "/about 1 unique views\n" \
            "/about/1 1 unique views\n"
        ).to_stdout
      end
    end
  end
end
