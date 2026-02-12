trait BankAccount {
  def closeAccount(): Unit
  def getBalance: Option[Int]
  def incrementBalance(increment: Int): Option[Int]
}

class BankAccountImpl extends BankAccount {
  private var balance: Option[Int] = Some(0)
  override def closeAccount(): Unit = balance = None
  override def getBalance: Option[Int] = balance
  override def incrementBalance(increment: Int): Option[Int] = {
    balance = balance.map(_ + increment)
    balance
  }
}

object Bank {
  def openAccount(): BankAccount = new BankAccountImpl
}

