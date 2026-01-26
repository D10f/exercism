class ScoreBoard

  TABLE_FORMAT = '%-30s | %2s | %2s | %2s | %2s | %2s'
  TABLE_HEADER = TABLE_FORMAT % %w[Team MP W D L P] + "\n"

  private

  attr_writer :row_format, :header

  def initialize(format = TABLE_FORMAT, header = TABLE_HEADER)
    self.row_format = '%-30s | %2s | %2s | %2s | %2s | %2s'
    self.header = '%-30s | %2s | %2s | %2s | %2s | %2s' % %w[Team MP W D L P] + "\n"
  end

  public

  attr_reader :row_format, :header

  def format(teams)
    teams.sort.each_with_object(header) do |team, str|
      row = row_format % [team.name, team.matches_played, team.wins,
                          team.draws, team.losses, team.points]
      str << row << "\n"
    end
  end

end

class Match

  private

  attr_accessor :team_a,
                :team_b,
                :result

  def initialize(team_a, team_b, result)
    self.team_a = team_a
    self.team_b = team_b
    self.result = result
    play
  end

  def play
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

end

class Team

  include Comparable

  POINTS = {
    win: 3,
    loss: 0,
    draw: 1,
  }

  private

  attr_accessor :name,
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

  def <=>(other)
    point_diff = other.points - points
    point_diff.nonzero? and point_diff or name <=> other.name
  end

end

class Tournament

  private

  attr_accessor :matches, :teams

  def initialize(match_records)
    self.matches = []
    self.teams = []
    process_records(match_records)
  end

  def process_records(match_records)
    return if match_records.chomp.empty?
    tmp_teams_hash = {}
    match_records.lines(chomp: true) do |line|
      team_a, team_b, result = line.split(';')
      team_a = tmp_teams_hash[team_a] ||= Team.new(team_a)
      team_b = tmp_teams_hash[team_b] ||= Team.new(team_b)
      matches << Match.new(team_a, team_b, result)
    end
    self.teams = tmp_teams_hash.values
  end

  public

  attr_reader :teams

  def self.tally(match_records)
    new(match_records).to_s
  end

  def to_s
    board = ScoreBoard.new
    board.format(teams)
  end

end