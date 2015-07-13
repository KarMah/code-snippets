require 'date'
module DataMapper
  class Resource
    def initialize(params)
      self.name        = params.fetch(:filename)
      self.columns     = params.fetch(:columns)
      self.delimiter     = params.fetch(:delimiter)
    end

    attr_reader :columns, :name, :delimiter

    def all
      load_data
    end

    private
    attr_writer :name, :columns, :delimiter

    def fullpath
      path + "/#{name.to_s}.txt"
    end

    def path
      File.expand_path('../../../data', __FILE__)
    end

    def load_data
      rows = []
      file = File.open(fullpath, 'r')
      while !file.eof?
        rows << parse_line(file.readline)
      end
      rows
    end

    def parse_line(line)
      values = line.split(delimiter).map(&:strip)
      row = {}
      columns.each_with_index do |(col, meta), index|
        row[col] = case meta[:type].to_sym
                     when :string
                       values[index].to_s
                     when :date
                       Date.strptime(values[index], meta[:format])
                   end
      end
      row
    end
  end
end
