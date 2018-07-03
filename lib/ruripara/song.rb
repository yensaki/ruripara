module Pripara
  class Song < Base
    ATTR_KEYS = %i(title singer writer composer arranger).freeze

    ATTR_KEYS.each do |key|
      define_method key do
        @attributes[key.to_s]
      end
    end

    class << self
      def config_file_name
        "songs.yml"
      end

      private

      def attr_keys
        ATTR_KEYS
      end
    end
  end
end
