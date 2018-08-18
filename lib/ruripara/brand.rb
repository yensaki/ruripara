module Pripara
  class Brand < Base
    ATTR_KEYS = %i(id name kana charm_id).freeze

    ATTR_KEYS.each do |key|
      define_method key do
        @attributes[key.to_sym]
      end
    end

    def charm
      @charm ||= Pripara::Charm.find_by(id: charm_id) if charm_id
    end

    class << self
      def config_file_name
        "brands.yml"
      end

      private

      def attr_keys
        ATTR_KEYS
      end
    end
  end
end
