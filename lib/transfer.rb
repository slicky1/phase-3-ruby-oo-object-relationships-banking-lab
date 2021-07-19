class Transfer

  # Changed the code next line from accessor to reader as influenced by 
  #  the official solution despite passed tests of the original solution
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    (@sender.valid? && @receiver.valid? && @amount <= @sender.balance)
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
      return
    end
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end
end