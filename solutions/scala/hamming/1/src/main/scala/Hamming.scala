object Hamming {
  def distance(strandA: String, strandB: String): Option[Int] = {
    if (strandA.size != strandB.size) {
      return None
    }

    Some(strandA.zip(strandB).count( { (a,b) => a != b } ))
  }
}