class Oystercard 
  attr_reader :balance 

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @in_journey = false
    @balance = 0
  end
 
  def top_up(amount)
    fail "Maximum balance cannot exceed £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Balance is less that £#{MIN_FARE}" if @balance < MIN_FARE
    @in_journey = true
  end
  #Update the touch_out method to reduce the balance by minimum fare.
  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
