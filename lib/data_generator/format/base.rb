module DataGenerator
  module Format
    class Base
      def initialize(input_stream)
        @input_stream = input_stream
      end

      def write(row = {})
        raise 'Method write(...) is not implemented'
      end

      # Finish of writing data to the stream
      def flush
      end
    end
  end
end