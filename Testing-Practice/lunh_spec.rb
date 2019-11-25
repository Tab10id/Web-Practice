require "lunh.rb"

RSpec.describe CardChecker do
  describe ".Algorithm"
  it "returns true for valid card" do
    expect(described_class.new.Algorithm("4561261212345467")).to be_truthy
  end
  it "returns false for invalid card" do
    expect(described_class.new.Algorithm("4561261212345464")).to be_falsey
  end
  it "returns true for false for valid card with spaces" do
    expect(described_class.new.Algorithm("4561 2612 1234 5467")).to be_truthy
  end

  class CardCheckerMock
    attr_reader :arg
    class << self
      def Algorithm(arg)
        puts arg
        true
      end
    end
  end

end
