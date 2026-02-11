object SpaceAge {

  // Constant names should be in upper camel case, similar to Java’s static final members.
  val EarthYearInSeconds = 31557600

  // Orbital period in Earth years
  val VenusOrbit = 0.61519726
  val MercuryOrbit = 0.2408467
  val MarsOrbit = 1.8808158
  val JupiterOrbit = 11.862615
  val SaturnOrbit = 29.447498
  val UranusOrbit = 84.016846
  val NeptuneOrbit = 164.79132

  def onEarth(ageInSeconds: Double): Double = ageInSeconds / EarthYearInSeconds

  def onVenus(ageInSeconds: Double): Double = onEarth(ageInSeconds) / VenusOrbit

  def onMercury(ageInSeconds: Double): Double = onEarth(ageInSeconds) / MercuryOrbit

  def onMars(ageInSeconds: Double): Double = onEarth(ageInSeconds) / MarsOrbit

  def onJupiter(ageInSeconds: Double): Double = onEarth(ageInSeconds) / JupiterOrbit

  def onSaturn(ageInSeconds: Double): Double = onEarth(ageInSeconds) / SaturnOrbit

  def onUranus(ageInSeconds: Double): Double = onEarth(ageInSeconds) / UranusOrbit

  def onNeptune(ageInSeconds: Double): Double = onEarth(ageInSeconds) / NeptuneOrbit
}
