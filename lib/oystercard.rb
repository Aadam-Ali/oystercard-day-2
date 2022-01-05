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

<<<<<<< HEAD
  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end
  
  def touch_out
    @in_journey = false
=======
  def deduct(amount)
    @balance -= amount
>>>>>>> 2d3ed0fe668d3251c872cdee3ca9c6a0e8ef99bd
  end
end