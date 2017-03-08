module DataGenerator
  class Model
    attr_reader :attributes

    def initialize
      @attributes = Hash.new
    end

    def method_missing(m, *args, &block)
      match_result = /\A(.+)=\Z/.match(m.to_s)
      if match_result
        @attributes[match_result[1].to_sym] = args.first
      else
        super(m, args, block)
      end
    end
  end
end