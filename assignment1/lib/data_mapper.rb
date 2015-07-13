module DataMapper
end
lib = File.expand_path(File.dirname(__FILE__))
Dir[lib + '/data_mapper/*.rb'].each { |file| require file }
