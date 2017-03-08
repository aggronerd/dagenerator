require 'data_generator/mutation/base'

module DataGenerator
  module Mutation
    # Takes 'odds' parameter to determine whether to perform this mutation or not.
    class Random < Base
      def odds
        properties['odds'] || 1.0
      end

      def apply(value, entity)
        if rand < odds.to_f
          _apply(value, entity)
        else
          value
        end
      end
    end
  end
end