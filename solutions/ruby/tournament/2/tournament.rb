class Team

  private attr_writer :name, :wins, :losses, :draws
  public attr_reader  :name, :wins, :losses, :draws

  def initialize(name)
    self.name = name
    self.wins = 0
    self.losses = 0
    self.draws = 0
  end

  def add_win!
    self.wins += 1
  end

  def add_draw!
    self.draws += 1
  end

  def add_loss!
    self.losses += 1
  end

  def points
    self.wins * 3 + self.draws
  end

  def matches_played
    self.draws + self.wins + self.losses
  end
end

class MatchTable

  private attr_writer :teams
  public  attr_reader :teams

  def initialize
    self.teams = {}
  end

  def add_match(t1, t2, result)
    team1 = self.teams[t1.to_sym] ||= Team.new(t1)
    team2 = self.teams[t2.to_sym] ||= Team.new(t2)
    self.resolve_match(team1, team2, result)
  end

  private def resolve_match(team1, team2, result)
    case result
    when "win"
      team1.add_win!
      team2.add_loss!
    when "loss"
      team1.add_loss!
      team2.add_win!
    else
      team1.add_draw!
      team2.add_draw!
    end
  end
end

class Tournament

  def self.tally(input, columns: ["Team", "MP", "W", "D", "L", "P"], format: "%-30s | %2s | %2s | %2s | %2s | %2s")
    table = MatchTable.new

    input.split("\n").each do |result|
      team1, team2, result = result.split(";")
      table.add_match(team1, team2, result)
    end

    sorted = table.teams.values.sort do |a, b|
      (b.points <=> a.points).nonzero? || a.name <=> b.name
    end

    header = "#{format}\n" % columns
    sorted.inject(header) do |str, team|
      str += "#{format}\n" % [team.name, team.matches_played, team.wins, team.draws, team.losses, team.points]
    end
  end
end
