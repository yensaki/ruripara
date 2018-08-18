# rubocop:disable Metrics/BlockLength
RSpec.describe Pripara::Base do
  class Restaurant < described_class
    ATTR_KEYS = %i(name cook).freeze

    class << self
      private

      def config_file_path
        File.join(File.dirname(__FILE__), "fixtures/restaurants.yml")
      end

      def attr_keys
        ATTR_KEYS
      end
    end
  end

  describe "InstanceMethods" do
    describe "#match?" do
      subject { instance.match?(attrs) }

      context "string attributes" do
        let(:instance) { described_class.new("name" => "some_name", "age" => 20) }

        let(:attrs) { { "name" => "some_name" } }
        it { is_expected.to be_truthy }
      end

      context "symbol attributes" do
        let(:instance) { described_class.new("name" => "some_name", "age" => 20) }

        let(:attrs) { { name: "some_name" } }
        it { is_expected.to be_truthy }
      end
    end
  end

  describe "ClassMethods" do
    describe "#all" do
      subject { Restaurant.all }

      it { is_expected.to all(be_a Restaurant) }
      it { expect(subject.size).to eq 2 }
    end

    describe "#find_by" do
      subject { Restaurant.find_by(attributes) }

      context "single attribute" do
        let(:attributes) { { name: "パパのパスタ" } }
        it { expect(subject.attributes).to eq(id: 1, name: "パパのパスタ", cook: "らぁらのパパ") }
      end

      context "multiple attributes" do
        let(:attributes) { { name: "パパのパスタ", cook: "らぁらのパパ" } }
        it { expect(subject.attributes).to eq(id: 1, name: "パパのパスタ", cook: "らぁらのパパ") }
      end

      context "incorrect attributes value" do
        let(:attributes) { { name: "パパのパスタ", cook: "ドロシー・レオナのパパ" } }
        it { is_expected.to be_nil }
      end

      context "undefined attributes key" do
        subject do
          -> { Restaurant.find_by(attributes) }
        end
        let(:attributes) { { name: "パパのパスタ", cooker: "らぁらのパパ" } }
        it { is_expected.to raise_error(ArgumentError) }
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
