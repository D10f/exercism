module SavingsAccount

  NON_NEGATIVE_INTEREST_RATE = 0.5
  OVER_1000_INTEREST_RATE = 1.621
  OVER_5000_INTEREST_RATE = 2.475
  NEGATIVE_INTEREST_RATE = 3.213
  
  def self.interest_rate(balance)
    if balance >= 5000
      OVER_5000_INTEREST_RATE
    elsif balance >= 1000
      OVER_1000_INTEREST_RATE
    elsif balance >= 0
      NON_NEGATIVE_INTEREST_RATE
    else
      NEGATIVE_INTEREST_RATE
    end
  end

  def self.annual_balance_update(balance)
    balance + (balance * self.interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    updated_balance = current_balance
    while updated_balance < desired_balance
      updated_balance = self.annual_balance_update(updated_balance)
      years += 1
    end
    years
  end
end
