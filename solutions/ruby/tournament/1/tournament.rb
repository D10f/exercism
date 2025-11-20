class Tournament
    class Team
        attr_reader :name
        attr_reader :total_matches
        attr_reader :wins
        attr_reader :loses
        attr_reader :draws
        attr_reader :points

        def initialize(name)
            @name = name
            @total_matches = 0
            @wins = 0
            @loses = 0
            @draws = 0
            @points = 0
        end

        def add_win!()
            @total_matches = @total_matches + 1
            @wins = @wins + 1
            @points = @points + 3
        end

        def add_draw!()
            @total_matches = @total_matches + 1
            @draws = @draws + 1
            @points = @points + 1
        end

        def add_loss!()
            @total_matches = @total_matches + 1
            @loses = @loses + 1
        end
    end

    class Table

        def initialize(matches)
            @results = {}

            matches.split("\n").each do |match|
                team1, team2, result = match.split(";")

                @results[team1] = Team.new(team1) if ! @results.include?(team1)
                @results[team2] = Team.new(team2) if ! @results.include?(team2)

                case result
                when "win"
                    @results[team1].add_win!
                    @results[team2].add_loss!
                when "loss"
                    @results[team1].add_loss!
                    @results[team2].add_win!
                else
                    @results[team1].add_draw!
                    @results[team2].add_draw!
                end
            end
        end

        def get_sorted_table()
            table_str = ""
            table_str << "Team ".ljust(30)
            table_str << " | MP |  W |  D |  L |  P\n"

            sorted = @results.values.sort do |a, b|
                (b.points <=> a.points).nonzero? || a.name <=> b.name
            end

            sorted.each do | item |
                table_str << "#{item.name.ljust(30)} | "
                table_str << "#{item.total_matches.to_s.rjust(2)} | "
                table_str << "#{item.wins.to_s.rjust(2)} | "
                table_str << "#{item.draws.to_s.rjust(2)} | "
                table_str << "#{item.loses.to_s.rjust(2)} | "
                table_str << "#{item.points.to_s.rjust(2)}\n"
            end

            table_str
        end
    end

    def self.tally(input)
        table = Table.new(input)
        table.get_sorted_table
    end
end
