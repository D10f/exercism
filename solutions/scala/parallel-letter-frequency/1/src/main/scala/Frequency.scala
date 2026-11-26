object Frequency:

  def mergeFrequencyMaps(a: Map[Char, Int], b: Map[Char, Int]) =
    b.foldLeft(a): (acc, entry) =>
      val letter = entry.head
      val count  = entry.last
      acc.updated(letter, acc.getOrElse(letter, 0) + count)

  def frequency(numWorkers: Int, texts: Seq[String]): Map[Char, Int] =
    texts.foldLeft(Map.empty[Char, Int]): (outer, text) =>
      val inner = text.toLowerCase.foldLeft(Map.empty[Char, Int]): (inner, char) =>
        if char.isLetter then
          inner.updated(char, inner.getOrElse(char, 0) + 1)
        else
          inner
      mergeFrequencyMaps(outer, inner)