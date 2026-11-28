import java.util.concurrent.Executors
import scala.concurrent.duration.*
import scala.concurrent.{Await, Future, ExecutionContext}
// import scala.concurrent.ExecutionContext.Implicits.global

// https://docs.scala-lang.org/overviews/core/futures.html#the-global-execution-context

object Frequency:

  private def countLetters(text: String): Map[Char, Int] =
    text.toLowerCase.foldLeft(Map.empty[Char, Int]): (freqMap, letter) =>
      if letter.isLetter then
        freqMap.updated(letter, freqMap.getOrElse(letter, 0) + 1)
      else
        freqMap

  def frequency(numWorkers: Int, texts: Seq[String]): Map[Char, Int] =
    val pool = Executors.newFixedThreadPool(numWorkers)
    given ExecutionContext = ExecutionContext.fromExecutorService(pool)
    Await.result(
      Future
        .traverse(texts)(text => Future(countLetters(text)))
        .map(_.flatten.groupMapReduce(_._1)(_._2)(_ + _)),
      10.seconds
    )