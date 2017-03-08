require 'data_generator/mutation/random'

module DataGenerator
  module Mutation
    # May make the string value another value from the object
    #
    # Requires property 'source' to indicate alternative field as source
    class MayBe < Random
      def _apply(value, entity)
        entity.attributes[properties.fetch('source')]
      end
    end
  end
end
