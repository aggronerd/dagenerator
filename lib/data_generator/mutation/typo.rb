require 'data_generator/mutation/random'

module DataGenerator
  module Mutation
    # Randomly swaps two consecutive characters around in the string
    class Typo < Random
      def _apply(value, entity)
        return value if value.nil? || value.length < 2
        value = value.clone
        base = rand(value.length - 1)
        value[base], value[base + 1] = value[base + 1], value[base]
        value
      end
    end
  end
end