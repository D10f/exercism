object Etl {
  def transform(scoreMap: Map[Int, Seq[String]]): Map[String, Int] = {

    scoreMap.flatMap((grade, letters) => {
      letters.map(letter => (letter.toLowerCase, grade))
    })

  }
}