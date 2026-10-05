object Bob {

  private val silence  = """^\s*$""".r
  private val yellingQuestion = """^\d*[A-Z]+\d*\?$""".r
  private val yelling  = """^\d*[A-Z]+\d*$""".r
  private val question = """.*\?$""".r
  private val irrelevant = """[\s%:\^@#\$\(\*,'\.\-_!]+""".r

  def response(statement: String): String = {
    irrelevant.replaceAllIn(statement, "") match {
      case silence()  => "Fine. Be that way!"
      case yellingQuestion() => "Calm down, I know what I'm doing!"
      case yelling()  => "Whoa, chill out!"
      case question() => "Sure."
      case _          => "Whatever."
    }
  }
}
