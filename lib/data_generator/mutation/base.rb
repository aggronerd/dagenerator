module DataGenerator
  module Mutation
    class Base
      attr_reader :type, :properties

      def initialize(attrs = {})
        @type = attrs.fetch('type')
        @properties = attrs.except('type')
      end

      def apply(value, entity)
        _apply(value, entity)
      end

      private

      def _apply(value, entity)
        raise 'Method _apply(...) is not implemented'
      end
    end
  end
end