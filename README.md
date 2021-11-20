## SMART

Smart is a simple Ruby Log Parser which displays the most visited routes or the most uniquely visited route based on the mode passed to it via the CLI
## Usage

Before cloning this repository, ensure you have ruby ~> 3.0 installed. You can use asdf to manage multiple ruby versions.
Also, install Bundler if you don't already have it 
    `gem install bundler`

After cloning this repository run cd into the root directory and run `bundle install` to get all dependencies.

To run the program you need to make the program executable
Run
    `chmod +x ./bin/parser.rb`

Run the parser with the provided example log file via:

    ./bin/parser.rb webserver.log

This will by default count total number of visits. 

To see the unique visits count, change the `mode` argument:

    ./bin/parser.rb webserver.log --mode=unique

You can also use --help to get help e.g.

    ./bin/parser.rb webserver.log --help

## Running tests

To run the tests, go to the root folder, and run `rspec`. 
The code currently has 97.98% coverage.