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

    it "raises an error when exceed the limit of £90" do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to raise_error("Maximum balance cannot exceed £#{max_balance}") 
    end
  end

  describe "#deduct" do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "deducts an amount from the balance" do
      subject.top_up(5)
      expect { subject.deduct(2) }.to change {subject.balance}.by -2
    end
  end
end