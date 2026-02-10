object Leap {
  def leapYear(year: Int): Boolean = {
    var divisibleBy4   = year % 4   == 0
    var divisibleBy100 = year % 100 == 0
    var divisibleBy400 = year % 400 == 0
    if divisibleBy4 && divisibleBy100 then
       divisibleBy400
    else
      divisibleBy4
  }
}
