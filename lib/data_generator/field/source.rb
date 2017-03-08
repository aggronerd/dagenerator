require 'active_support/core_ext/string'
require 'data_generator/field/base'

module DataGenerator
  module Field
    class Source < Base
      attr_reader :source

      def initialize(attrs = {})
        super attrs
        @source = attrs.fetch('source').to_sym
      end

      private

      def _value(entity)
        entity.attributes[source]
      end
    end
  end
end
