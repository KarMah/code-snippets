require 'forwardable'
module DataMapper
  class Base
    def self.inherited(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      extend Forwardable

      def all
        @resource.all.map { |res| Record.new(res) }
      end

      def setup(params)
        @resource = Resource.new(params)
      end
    end
  end
end
