require 'data_generator/concerns/yaml_object'
require 'active_support/core_ext/string'

module DataGenerator
  class Output
    extend YamlObject

    attr_reader :filename, :format, :share, :duplicate_odds, :fields, :stream

    def initialize(attrs = {})
      @filename = attrs.fetch('filename')
      @stream = File.open(filename, 'w')
      @format = load_format(attrs.fetch('format'))
      @share = attrs.fetch('share').to_f
      @duplicate_odds = attrs.fetch('duplicate_odds').to_f
      @fields = attrs.fetch('fields').collect { |f| load_field(f) }
    end

    def push(entity)
      row = {}
      fields.each { |f| row[f.label] = f.value(entity) }
      format.write(row)
    end

    # Finish writing to the file and close any connections
    def close
      format.flush
      stream.close
    rescue Exception => e
      puts "There was an issue closing the stream: #{e}"
    end

    private

    def load_format(format)
      raise "Invalid format: #{format}" unless /\A[a-z_]+\Z/.match(format)
      require "data_generator/format/#{format}"
      "DataGenerator::Format::#{format.camelize}".constantize.new(stream)
    end

    def load_field(field)
      field_type = field['type'] || 'source'
      raise "Invalid field: #{field_type}" unless /\A[a-z_]+\Z/.match(field_type)
      require "data_generator/field/#{field_type}"
      "DataGenerator::Field::#{field_type.camelize}".constantize.new(field)
    end
  end
end
