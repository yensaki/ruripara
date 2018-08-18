module Pripara
  class Base
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes.map { |k, v| [k.to_sym, v] }.to_h
    end

    def match?(attrs)
      attrs.all? { |key, value| @attributes[key.to_sym] == value }
    end

    class << self
      def all
        config.map { |attributes| new(attributes) }
      end

      def find_by(attributes)
        raise ArgumentError unless (attributes.keys - attr_keys).empty?
        all.find { |obj| obj.match?(attributes) }
      end

      private

      def config
        @config ||= YAML.load_file(config_file_path)
      end

      def config_file_path
        File.join(File.dirname(__FILE__), "../../config/", config_file_name)
      end

      def config_file_name
        raise NotImplementedError
      end

      def attr_keys
        raise NotImplementedError
      end
    end
  end
end
