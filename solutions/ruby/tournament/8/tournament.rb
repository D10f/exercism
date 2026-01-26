class ScoreBoard

  TABLE_FORMAT = '%-30s | %2s | %2s | %2s | %2s | %2s'
  TABLE_HEADER = TABLE_FORMAT % %w[Team MP W D L P] + "\n"

  private

  attr_accessor :teams,
                :row_format,
                :header

  def initialize(teams, format = TABLE_FORMAT, header = TABLE_HEADER.clone)
    self.teams = teams
    self.row_format = format
    self.header = header
  end

  public

  attr_reader :teams,
              :row_format,
              :header

  def to_s
    teams.sort.each_with_object(header) do |team, str|
      row = row_format % [team.name, team.matches_played, team.wins,
                          team.draws, team.losses, team.points]
      str << row << "\n"
    end
  end

end

class Match

  private

  attr_accessor :home_team,
                :guest_team,
                :result

  def initialize(home_team, guest_team, result)
    self.home_team = home_team
    self.guest_team = guest_team
    self.result = result
  end

  public

  attr_reader :home_team,
              :guest_team,
              :result

  def play
    case result
    when 'win'
      home_team.win
      guest_team.loss
    when 'loss'
      home_team.loss
      guest_team.win
    else
      home_team.draw
      guest_team.draw
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
                :draws,
                :matches

  def initialize(name)
    self.name = name
    self.wins = 0
    self.losses = 0
    self.draws = 0
    self.matches = []
  end

  public

  attr_reader :name,
              :wins,
              :losses,
              :draws,
              :matches

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

  def self.tally(match_records)
    new(match_records).to_s
  end

  private

  attr_accessor :matches, :teams

  def initialize(match_records)
    self.matches = []
    self.teams = Hash.new { |hash, name| hash[name] = Team.new(name) }
    process_records(match_records)
  end

  def process_records(match_records)
    return if match_records.chomp.empty?

    match_records.lines(chomp: true) do |line|
      home_team, guest_team, result = line.split(';')
      match = Match.new(teams[home_team], teams[guest_team], result)
      match.play
      matches << match
    end
  end

  public

  attr_reader :teams

  def to_s
    ScoreBoard.new(teams.values).to_s
  end

end