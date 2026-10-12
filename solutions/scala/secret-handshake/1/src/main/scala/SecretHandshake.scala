import scala.collection.mutable.BitSet

object SecretHandshake {

  private val actions: Array[String] =
    Array("wink", "double blink", "close your eyes", "jump")

  def commands(number: Int) = {
    val result = (0 until 4).foldLeft(List[String]())((acc, idx) => {
      val hasBit = (number & math.pow(2, idx).toInt) != 0
      if hasBit then acc :+ actions(idx) else acc
    })

    if (number & 16) != 0 then result.reverse else result
  }
}
