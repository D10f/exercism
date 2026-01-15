class Team

  attr_reader :team_name, :wins, :losses, :draws

  def add_win
    self.wins += 1
  end

  def add_loss
    self.losses += 1
  end

  def add_draw
    self.draws = 1
  end

  def points
    wins * 3 + draws
  end

  def matches_played
    wins + losses + draws
  end

  private

  attr_writer :team_name, :wins, :losses, :draws

  def initialize(name)
    self.team_name = name
    self.wins = 0
    self.losses = 0
    self.draws = 0
  end

end

class MatchTable

  public

  attr_reader :teams

  def add_match(team1, team2, result)
    team1 = teams[team1.to_sym] ||= Team.new(team1)
    team2 = teams[team2.to_sym] ||= Team.new(team2)
    update_match(team1, team2, result)
  end

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

end

module Tournament

  TABLE_FORMAT = '%-30s | %2s | %2s | %2s | %2s | %2s'
  TABLE_HEADER = TABLE_FORMAT % %w[Team MP W D L P] + "\n"

  def self.tally(match_records)
    match_records.chomp!
    return TABLE_HEADER if match_records.empty? or match_records.start_with?('Team')
    
    table = create_table(match_records)
    format_table(table)
  end

  def self.create_table(match_records)
    table = MatchTable.new

    match_records.lines do |line|
      team1, team2, result = line.chomp.split(';')
      table.add_match(team1, team2, result)
    end

    table
  end

  def self.format_table(table)
    sorted = table.teams.values.sort do |team1, team2|
      (team2.points <=> team1.points).nonzero? or
        team1.team_name <=> team2.team_name
    end

    sorted.inject(TABLE_HEADER) do |accumulator, team|
      row = TABLE_FORMAT % [team.team_name, team.matches_played, team.wins,
                            team.draws, team.losses, team.points]
      accumulator + row + "\n"
    end
  end

end