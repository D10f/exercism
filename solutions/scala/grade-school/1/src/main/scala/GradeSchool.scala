class School {
  type DB = Map[Int, Seq[String]]

  private var dbs: DB = Map()

  def add(name: String, g: Int) =
    val names = dbs.getOrElse(g, Seq.empty[String]) :+ name
    dbs = dbs.updated(g, names)

  def db: DB = dbs

  def grade(g: Int): Seq[String] =
    dbs.getOrElse(g, Seq.empty[String])

  def sorted =
    dbs.keys.toList.sorted.foldLeft(Map():DB) { (acc, curr) => 
      acc.updated(curr, dbs.get(curr).get.sorted)
    }
}