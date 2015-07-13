module DataMapper
  class Record
    def initialize(attributes)
      self.data = attributes.dup
      build_readers
    end

    private
    attr_accessor :data

    def build_readers
      data.each do |name, value|
        define_singleton_method(name) { value }
      end
    end
  end
end
