module Pripara
  class Charm < Base
    ATTR_KEYS = %i(id slug name).freeze

    ATTR_KEYS.each do |key|
      define_method key do
        @attributes[key.to_sym]
      end
    end

    class << self
      def config_file_name
        "charms.yml"
      end

      private

      def attr_keys
        ATTR_KEYS
      end
    end
  end
end
