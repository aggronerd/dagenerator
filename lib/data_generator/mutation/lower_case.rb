require 'data_generator/mutation/random'
require 'active_support/core_ext/object'

module DataGenerator
  module Mutation
    # May make the string value lower-case
    class LowerCase < Random
      def _apply(value, entity)
        return value unless value.present?
        value.downcase
      end
    end
  end
end