require 'oystercard'

describe Oystercard do
  describe "#balance" do
    it "initally has a balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can top up the balance" do
      expect { subject.top_up(5) }.to change { subject.balance }.by 5
    end
  end
end