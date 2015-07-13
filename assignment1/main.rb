require 'logger'

root = File.expand_path(File.dirname(__FILE__))
require root + '/lib/data_mapper.rb'
Dir[root + '/lib/*.rb'].each { |file| require file }

logger = Logger.new(STDOUT)
logger.formatter = proc { |severity, datetime, progname, msg| "#{msg}\n" }

logger.info 'Output1:'
Result.output1.each do |result|
  logger.info result.to_s
end
logger.info ''
logger.info 'Output2:'
Result.output2.each do |result|
  logger.info result.to_s
end
logger.info ''
logger.info 'Output3:'
Result.output3.each do |result|
  logger.info result.to_s
end
