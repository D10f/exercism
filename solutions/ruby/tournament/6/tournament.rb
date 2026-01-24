class Team

  POINTS = {
    win: 3,
    loss: 0,
    draw: 1,
  }

  private

  attr_writer :name,
              :wins,
              :losses,
              :draws

  def initialize(name)
    self.name = name
    self.wins = 0
    self.losses = 0
    self.draws = 0
  end

  public

  attr_reader :name,
              :wins,
              :losses,
              :draws

  def win
    self.wins += 1
  end

  def loss
    self.losses += 1
  end

  def draw
    self.draws += 1
  end

  def points
    wins * POINTS[:win] + losses * POINTS[:loss] + draws * POINTS[:draw]
  end

  def matches_played
    wins + losses + draws
  end

end

class MatchTable

  SORT_BY_POINTS = Proc.new { |team_a, team_b|
    (team_b.points <=> team_a.points).nonzero? or team_a.name <=> team_b.name
  }

  private

  attr_writer :teams

  def initialize
    self.teams = {}
  end

  def update_match(team_a, team_b, result)
    case result
    when 'win'
      team_a.win
      team_b.loss
    when 'loss'
      team_a.loss
      team_b.win
    else
      team_a.draw
      team_b.draw
    end
  end

  public

  attr_reader :teams

  def add_match(team_a, team_b, result)
    team_a = teams[team_a] ||= Team.new(team_a)
    team_b = teams[team_b] ||= Team.new(team_b)
    update_match(team_a, team_b, result)
  end

  def format(header:, format:)
    teams.values.sort(&SORT_BY_POINTS).inject(header) do |accumulator, team|
      row = Row.new(team).format(format)
      "%<accumulator>s%<row>s\n" % { accumulator:, row: }
    end
  end

end

class Row

  private

  attr_accessor :team

  def initialize(team)
    self.team = team
  end

  public

  def format(format)
    format % [team.name, team.matches_played, team.wins,
              team.draws, team.losses, team.points]
  end

end

module Tournament

  TABLE_FORMAT = '%-30s | %2s | %2s | %2s | %2s | %2s'
  TABLE_HEADER = TABLE_FORMAT % %w[Team MP W D L P] + "\n"

  def self.tally(match_records)
    return TABLE_HEADER if match_records.chomp.empty?

    table = MatchTable.new

    match_records.lines do |line|
      team_a, team_b, result = line.chomp.split(';')
      table.add_match(team_a, team_b, result)
    end

    table.format(header: TABLE_HEADER, format: TABLE_FORMAT)
  end

end
