local BankAccount = {}

function BankAccount:new()
  local account = {
    _balance = 0,
    is_open = false
  }
  setmetatable(account, self)
  self.__index = self
  return account
end

function BankAccount:open()
  if self.is_open then
    error('Cannot open an already opened account')
  end
  self.is_open = true
end

function BankAccount:close()
  if not self.is_open then
    error('Cannot close an account that has not been opened')
  end
  self.is_open = false
  self._balance = 0
end

function BankAccount:deposit(amount)
  if not self.is_open then
    error('Cannot deposit into a closed account')
  end

  self._balance = self._balance + amount

  if amount < 0 then
    error('Cannot deposit a negative amount')
  end

end

function BankAccount:withdraw(amount)
  if not self.is_open then
    error('Cannot withdraw from a closed account')
  end

  if amount > self._balance then
    error('Not enough funds')
  end

  if amount < 0 then
    error('Cannot withdraw a negative amount')
  end

  self._balance = self._balance - amount
end

function BankAccount:balance()
  if not self.is_open then
    error('Cannot check balance on a closed account')
  end
  return self._balance
end

return BankAccount
