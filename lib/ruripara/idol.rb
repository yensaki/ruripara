module Pripara
  class Idol < Base
    ATTR_KEYS = %i(slug name cast_name).freeze

    ATTR_KEYS.each do |key|
      define_method key do
        @attributes[key.to_s]
      end
    end

    class << self
      def config_file_name
        'idols.yml'
      end

      private

      def attr_keys
        ATTR_KEYS
      end
    end
  end
end