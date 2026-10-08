enum Bearing {
  case North, East, South, West
}

case class Robot(
  private var _bearing: Bearing,
  private var _coordinates: (Int, Int)
) {
  
  def coordinates: (Int, Int) = _coordinates
  def bearing: Bearing = _bearing

  def turnRight: Robot = {
    _bearing = _bearing match {
      case Bearing.North => Bearing.East
      case Bearing.East  => Bearing.South
      case Bearing.South => Bearing.West
      case Bearing.West  => Bearing.North
    }
    Robot(_bearing, _coordinates)
  }
  
  def turnLeft: Robot = {
    _bearing = _bearing match {
      case Bearing.North => Bearing.West
      case Bearing.West  => Bearing.South
      case Bearing.South => Bearing.East
      case Bearing.East  => Bearing.North
    }
    Robot(_bearing, _coordinates)
  }

  def advance: Robot = {
    _coordinates = _bearing match {
      case Bearing.North => (_coordinates(0), _coordinates(1) + 1)
      case Bearing.West  => (_coordinates(0) - 1, _coordinates(1))
      case Bearing.South => (_coordinates(0), _coordinates(1) - 1)
      case Bearing.East  => (_coordinates(0) + 1, _coordinates(1))
    }
    Robot(_bearing, _coordinates)
  }

  def simulate(instructions: String) = {
    instructions.foldLeft(this)({
      case (robot, 'R') => robot.turnRight
      case (robot, 'L') => robot.turnLeft
      case (robot, 'A') => robot.advance
    })
  }
}