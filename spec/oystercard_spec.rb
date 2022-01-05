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

<<<<<<< HEAD
  describe "#in_journey?" do
    it "is initially not on a journey" do
      expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    it "is in a journey after touching in" do 
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe "#touch_out" do
    it "is not in a journey after touching out" do
      subject.touch_in 
      subject.touch_out
      expect(subject).not_to be_in_journey
=======
  describe "#deduct" do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "deducts an amount from the balance" do
      subject.top_up(5)
      expect { subject.deduct(2) }.to change {subject.balance}.by -2
>>>>>>> 2d3ed0fe668d3251c872cdee3ca9c6a0e8ef99bd
    end
  end
end