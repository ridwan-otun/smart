require "./lib/formatter/unique_entry.rb"

RSpec.describe Formatter::UniqueEntry do
    subject { described_class.call(tally: tally) }

    let(:tally) do
        {
            "/hello" => 2,
            "/howdy" => 1,
            "/about" => 1,
            "/about/1" => 1,
        }
    end

    describe "#call" do
        it "returns a formatted representation of routes and their unique views" do
            expect(subject).to eq(
                [
                    "/hello 2 unique views",
                    "/howdy 1 unique views",
                    "/about 1 unique views",
                    "/about/1 1 unique views",
                ]
            )
        end
    end
end