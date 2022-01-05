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

  describe "#in_journey?" do
    it "is initially not on a journey" do
      expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    it "is in a journey after touching in" do 
      subject.top_up(5)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "fails if the balance is less than £1" do
      min_fare = 1
      expect { subject.touch_in }.to raise_error "Balance is less that £#{min_fare}"
    end
  end

  describe "#touch_out" do
    it "is not in a journey after touching out" do
      subject.top_up(5)
      subject.touch_in 
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it "deduct from the balance after touching out" do 
      min_fare = Oystercard::MIN_FARE
      subject.top_up(5)
      subject.touch_in 
      expect{ subject.touch_out }.to change { subject.balance }.by -min_fare

    end
  end
end