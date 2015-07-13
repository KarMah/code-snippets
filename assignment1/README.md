* Ruby Version - 2.0.0p598
* RSpec Version - 3.2.3

* ./lib contains all the classes required to run the program
* ./spec lists all the specs (unit tests)

Usage:
    ruby main.rb > data/sample_output.txt

Considering comma_delimited.txt, pipe_delimited.txt, and space_delimited.txt as data sources,
we can implement a pattern similar to active record as

* DataMapper::Base - Extended by classes(model like classes) PipeDelimited, SpaceDelimited, CommaDelimited
* DataMapper::Resource - Interacts with and parses the data stores and returns data in the form of a hash
* DataMapper::Record - Generates reader methods

* PipeDelimited, SpaceDelimited, CommaDelimited - Models for various sources
* Result - Wraps the underlying models and provides accessibility of data across various models
