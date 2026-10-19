class DNA(private val _nucleotides: String) {

  def nucleotideCounts: Either[String, Map[Char, Int]] = {
    var sequence = Map('A' -> 0, 'T' -> 0, 'C' -> 0, 'G' -> 0)

    _nucleotides.foreach(c => {
      c match {
        case 'A' | 'T' | 'C' | 'G' => {
          sequence = sequence.updatedWith(c) {
            case Some(v) => Some(v + 1)
            case None    => Some(1)
          }
        }
        case _ => return Left("Invalid nucleotide found.")
      }
    })

    Right(sequence)
  }
}