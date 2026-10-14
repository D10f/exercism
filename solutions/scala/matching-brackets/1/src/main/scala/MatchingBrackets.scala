import scala.collection.mutable.Stack

object MatchingBrackets {

  val mapping = Map(
    ('[' -> ']'),
    ('{' -> '}'),
    ('(' -> ')')
  )

  def isPaired(input: String): Boolean = {

    val stack = Stack[Char]()

    input.foreach(ch => {
      ch match {
        case ('[' | '{' | '(') => stack.push(ch)
        case (']' | '}' | ')') => {
          if (stack.isEmpty || mapping.get(stack.pop()).get != ch) {
            return false
          }
        }
        case _ => 
      }
    })

    stack.isEmpty
  }
}
