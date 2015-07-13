require 'forwardable'
class Result
  extend Forwardable

  def_delegators :@record, :first_name, :last_name, :dob, :gender, :color
  class << self
    def output1
      all.sort_by {|res| [res.gender[0], res.name] }
    end

    def output2
      all.sort_by {|res| [res.dob, res.name] }
    end

    def output3
      all.sort {|res1, res2| res2.name <=> res1.name }
    end

    def all
      space_delimited_data + pipe_delimited_data + comma_delimited_data
    end

    def space_delimited_data
      SpaceDelimited.all.map { |rec| Result.new(rec) }
    end

    def pipe_delimited_data
      PipeDelimited.all.map { |rec| Result.new(rec) }
    end

    def comma_delimited_data
      CommaDelimited.all.map { |rec| Result.new(rec) }
    end
  end

  def initialize(record)
    @record = record
  end

  def name
    "#{@record.last_name} #{@record.first_name}"
  end

  def to_s
    "#{name} #{gender} #{dob.strftime('%-m/%-d/%Y')} #{color}"
  end
end
