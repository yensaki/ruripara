RSpec.describe Pripara::Base do
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
end
