module Reader
    class FileReader
        def self.call(file_path:)
            new.call(file_path: file_path)
        end

        def call(file_path:)
            raise "The file path provided does not exist. kindly provide a valid file path" unless File.exist?(file_path)

            read(file_path: file_path)
        end

        private

        def read(file_path:)
            entries = []

            begin
                File.foreach(file_path) do |entry| 
                    entries << entry.strip
                end

                entries
            rescue Exception => e
                puts "File couldn't be read: #{e}"
            end
        end
    end
end