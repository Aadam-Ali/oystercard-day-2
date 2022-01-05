class Oystercard 
  attr_reader :balance 

  MAX_BALANCE = 90
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
    @in_journey = true
  end
  
  def touch_out
    @in_journey = false
  end
end