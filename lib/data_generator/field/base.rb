module DataGenerator
  module Field
    class Base
      attr_reader :label, :mutations

      def initialize(attrs = {})
        @label = attrs.fetch('label')
        @mutations = if attrs['mutations'].present?
           attrs['mutations'].collect { |m| load_mutation(m) }
          else
           []
          end
      end

      # Returns the calculated value
      def value(entity)
        apply_mutations(_value(entity), entity)
      end

      private

      def _value(entity)
        raise 'Method _value(...) not defined'
      end

      # Finds and loads mutations
      def load_mutation(attrs)
        type = attrs.fetch('type')
        raise "Mutation type invalid: #{type}" unless /\A[a-z_]+\Z/.match(type)
        require "data_generator/mutation/#{type}"
        "DataGenerator::Mutation::#{type.camelize}".constantize.new(attrs)
      end

      def apply_mutations(value, entity)
        mutations.each do |mutation|
          value = mutation.apply(value, entity)
        end
        value
      end
    end
  end
end