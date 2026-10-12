import scala.collection.mutable.BitSet

object SecretHandshake {

  private val actions = List("wink", "double blink", "close your eyes", "jump")

  def commands(number: Int) = {

    val result = (0 until 4).foldLeft(List[String]())((acc, idx) => {
      (number >> idx) & 1 match {
        case 0 => acc
        case 1 => acc :+ actions(idx)
      }
    })

    if (number & 16) != 0 then result.reverse else result
  }

}
