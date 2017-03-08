require 'data_generator/concerns/yaml_object'
require 'active_support/core_ext/string'
require 'data_generator/output'
require 'pp'

module DataGenerator
  class Generator
    extend YamlObject
    attr_reader :outputs, :factory, :quantity

    def initialize(attrs = {})
      @outputs = attrs.fetch('outputs').collect { |o| Output.new(o) }
      @factory = attrs.fetch('factory').to_sym
      @quantity = attrs.fetch('quantity').to_i
    end

    def generate
      puts 'Loading factory'
      require 'factory_girl'
      require "data_generator/factories/#{factory}_factory"

      puts 'Generating entities'
      quantity.times do |i|
        progress = i.to_f / quantity
        entity = FactoryGirl.build(factory)
        outputs.each do |output|
          if progress <= output.share
            output.push(entity)
            output.push(entity) if rand < output.duplicate_odds
          end
        end
      end
      outputs.each(&:close)

      puts 'Done'
    end
  end
end