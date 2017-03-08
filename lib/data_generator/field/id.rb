require 'data_generator/field/base'

module DataGenerator
  module Field
    # Generates incremental numerical values
    class Id < Base
      attr_reader :count

      def initialize(*attrs)
        super(*attrs)
        @count = 0
      end

      private

      def _value(entity)
        @count += 1
      end
    end
  end
end