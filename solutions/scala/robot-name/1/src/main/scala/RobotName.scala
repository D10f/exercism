import scala.util.Random

object RandomCodeGenerator {
  
  private var cache: Set[String] = Set()
  private val rng = new Random()

  def generateAlpha() = {
    (rng.nextInt(25) + 65).toChar
  }

  def generateNumeral() = {
    (rng.nextInt(10) + 48).toChar
  }

  def generate(): String = {
    val code = Seq(
      generateAlpha(),
      generateAlpha(),
      generateNumeral(),
      generateNumeral(),
      generateNumeral()
    ).mkString

    cache.contains(code) match {
      case true  => generate()
      case false => {
        cache = cache + code
        code
      }
    }
  }
}

class Robot {

  private var _name = RandomCodeGenerator.generate()

  def name = _name

  def reset() = {
    _name = RandomCodeGenerator.generate()
  }

}