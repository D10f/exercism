class Team

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

  def total_matches
    self.wins + self.losses + self.draws
  end

  def points
    self.wins * 3 + self.draws
  end
  
  private

  attr_writer :name, :wins, :losses, :draws

  def initialize(name)
    self.name   = name
    self.wins   = 0
    self.losses = 0
    self.draws  = 0
  end


end

class TeamTable

  attr_reader :matches

  def add_match(team1, team2, result)
    t1 = self.matches[team1] ||= Team.new(team1)
    t2 = self.matches[team2] ||= Team.new(team2)
    self.update_match(t1, t2, result)
  end

  def teams(sort_by: 'points', order: 'desc')
    sorted = self.matches.values.sort do |a, b|
        (b.public_send(sort_by) <=> a.public_send(sort_by)).nonzero? || a.name <=> b.name
    end

    order == 'desc' ? sorted : sorted.reverse
  end

  private

  attr_writer :matches

  def initialize
    self.matches = {}
  end

  def update_match(t1, t2, result)
    case result
    when "win"
      t1.add_win
      t2.add_loss
    when "loss"
      t1.add_loss
      t2.add_win
    else
      t1.add_draw
      t2.add_draw
    end
  end

end

class Tournament

  STANDARD_FORMAT = "%-30s | %2s | %2s | %2s | %2s | %2s"
  HEADERS = %w[Team MP W D L P]

  def self.tally(input)

    input.chomp!
    if input.empty? or input.start_with?("Team")
      return table_header
    end
    
    team_table = TeamTable.new

    input.lines do |line|
      team1, team2, result = line.chomp.split(";")
      team_table.add_match(team1, team2, result)
    end

    team_table.teams.inject(self.table_header) do |accumulator, team|
      accumulator + self.table_row(team)
    end
  end

  private

  def self.table_header
    (STANDARD_FORMAT % HEADERS) + "\n"
  end

  def self.table_row(team)
    (STANDARD_FORMAT % [team.name, team.total_matches, team.wins, team.draws, team.losses, team.points]) + "\n"
  end

end
