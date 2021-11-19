module Writer
    class Output
        def self.call(output:)
            new.call(output: output)
        end

        def call(output:)
            output.each do |visit|
                puts "#{visit}"
            end
        end
    end
end