import java.util.concurrent.Executors
import scala.concurrent.duration.*
import scala.concurrent.{Await, Future, ExecutionContext}
// import scala.concurrent.ExecutionContext.Implicits.global

// https://docs.scala-lang.org/overviews/core/futures.html#the-global-execution-context

object Frequency:

  private def countLetters(text: String): Map[Char, Int] =
    text.toLowerCase.foldLeft(Map.empty[Char, Int]): (freqMap, letter) =>
      if ! letter.isLetter then freqMap
      else freqMap.updated(letter, freqMap.getOrElse(letter, 0) + 1)

  def frequency(numWorkers: Int, texts: Seq[String]): Map[Char, Int] =
    val pool = Executors.newFixedThreadPool(numWorkers)

    // Create a new implicit Execution Context and store it
    // in a variable, so that it can be shutdown after it's used.
    implicit val ec = ExecutionContext.fromExecutorService(pool)

    try
      Await.result(
        Future
          .traverse(texts)(text => Future(countLetters(text)))
          .map(_.flatten.groupMapReduce(_._1)(_._2)(_ + _)),
        10.seconds
      )
    finally
      ec.shutdown()