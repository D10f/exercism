object Etl {
  def transform(scoreMap: Map[Int, Seq[String]]): Map[String, Int] = {
  
    var newScores: Map[String, Int] = Map()
    
    scoreMap.keys.foreach(key => {
      scoreMap.getOrElse(key, Seq.empty).foreach(letter => {
        newScores = newScores.updated(letter.toLowerCase(), key)
      })
    })
    
    newScores
  }
}