require 'data_generator/format/base'
require 'csv'

module DataGenerator
  module Format
    class Csv < Base
      attr_reader :headers, :rows

      def initialize(*args)
        super(*args)
        @rows = 0
        @csv = CSV.new(@input_stream)
        @headers = {}
      end

      def write(row = {})
        write_headers(row.keys) if rows.zero?
        @csv << ordered_row(row)
        @rows += 1
      end

      private

      # Returns an array of value in the right order
      def ordered_row(row = {})
        @headers.collect { |header| row[header] }
      end

      def write_headers(headers)
        @headers = headers
        @csv << @headers
      end
    end
  end
end