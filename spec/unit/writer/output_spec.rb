require "./lib/writer/output.rb"

RSpec.describe Writer::Output do
    subject { described_class.call(output: outputs) }

    let(:outputs) do
        [
            "first line",
            "second line",
        ]
    end

    describe "#call" do
        it "writes to standard output" do
            expect {subject}.to output(
                    "first line" + "\n" + "second line" + "\n"
                ).to_stdout
        end
    end
end