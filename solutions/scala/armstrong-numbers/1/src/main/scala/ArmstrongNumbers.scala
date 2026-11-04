object ArmstrongNumbers {
  def isArmstrongNumber(n: Int) = {
    val stringified = n.toString()
    val digits = stringified.length
    val sum = stringified.map(_.asDigit).foldLeft(0)((acc, curr) => {
      acc + Math.pow(curr, digits).toInt
    })
    n == sum
  }
}