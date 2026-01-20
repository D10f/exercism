class Team

  POINTS = { win: 3, loss: 0, draw: 0 }

  private

  attr_writer :name, :wins, :losses, :draws

  def initialize(name)
    self.name = name
    self.wins = 0
    self.losses = 0
    self.draws = 0
  end

  public

  attr_reader :name, :wins, :losses, :draws

  def add_win
    self.wins += 1
  end

  def add_loss
    self.losses += 1
  end

  def add_draw
    self.draws += 1
  end

  def points
    wins * 3 + draws
  end

  def matches_played
    wins + losses + draws
  end

end

class MatchTable

  private

  attr_writer :teams

  def initialize
    self.teams = {}
  end

  def update_match(team1, team2, result)
    case result
    when 'win'
      team1.add_win
      team2.add_loss
    when 'loss'
      team1.add_loss
      team2.add_win
    else
      team1.add_draw
      team2.add_draw
    end
  end

  public

  attr_reader :teams

  def add_match(team1, team2, result)
    team1 = teams[team1.to_sym] ||= Team.new(team1)
    team2 = teams[team2.to_sym] ||= Team.new(team2)
    update_match(team1, team2, result)
  end

  def format(header:, format:)

    sorted = teams.values.sort do |team1, team2|
      (team2.points <=> team1.points).nonzero? or
        team1.name <=> team2.name
    end

    sorted.inject(header) do |accumulator, team|
      row = format % [team.name, team.matches_played, team.wins,
                      team.draws, team.losses, team.points]
      accumulator + row + "\n"
    end
  end

end

module Tournament

  TABLE_FORMAT = '%-30s | %2s | %2s | %2s | %2s | %2s'
  TABLE_HEADER = TABLE_FORMAT % %w[Team MP W D L P] + "\n"

  def self.tally(match_records)

    return TABLE_HEADER if match_records.chomp.empty?

    table = MatchTable.new

    match_records.lines do |line|
      team1, team2, result = line.chomp.split(';')
      table.add_match(team1, team2, result)
    end

    table.format(header: TABLE_HEADER, format: TABLE_FORMAT)
  end

end