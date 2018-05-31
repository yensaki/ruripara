module Pripara
  class Girl
    %i(slug name cast_name).each do |key|
      define_method key do
        @attributes[key.to_s]
      end
    end

    def initialize(attributes)
      @attributes = attributes
    end

    def self.all
      config.map { |attributes| new(attributes) }
    end

    def self.find_by_name(name)
      all.find { |girl| girl.name == name }
    end

    private

    def self.config
      return @config if @config
      config_file = File.join File.dirname(__FILE__), '../../config/girls.yml'
      @config = YAML.load_file(config_file)
    end
  end
end