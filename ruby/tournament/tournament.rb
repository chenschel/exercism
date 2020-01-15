module Tournament
  HEADER = 'Team                           | MP |  W |  D |  L |  P'.freeze

  class << self
    def tally(input)
      teams, wins, draws, losses = parse_input(input)

      results = tally_results(teams, wins, draws, losses)
      results = sort_results(results)

      calculate_table(results)
    end

    private

    def calculate_table(results)
      output = []
      output << HEADER
      output << table_rows(results)
      output.flatten
            .compact
            .join("\n") + "\n"
    end

    def table_rows(results)
      results.map do |line|
        next if line[:team].nil?

        table_row(line)
      end
    end

    def table_row(line)
      team = line[:team].ljust(31, ' ')
      win = line[:win].to_s.rjust(3, ' ')
      draw = line[:draw].to_s.rjust(3, ' ')
      loss = line[:loss].to_s.rjust(3, ' ')
      matches = (line[:win] + line[:draw] + line[:loss]).to_s.rjust(3, ' ')
      points = calculate_points(line).to_s.rjust(3, ' ')

      "#{team}|#{matches} |#{win} |#{draw} |#{loss} |#{points}"
    end

    def sort_results(results)
      results.sort do |team_a, team_b|

        if draw?(team_a, team_b)
          team_a[:team] <=> team_b[:team]
        else
          calculate_points(team_b) <=> calculate_points(team_a)
        end
      end
    end

    def draw?(elem_a, elem_b)
      calculate_points(elem_a) == calculate_points(elem_b)
    end

    def calculate_points(team)
      team[:win] * 3 + team[:draw]
    end

    def parse_input(input)
      teams = []
      wins = []
      draws = []
      losses = []

      input.each_line.map do |line|
        team_a, team_b, result = line.chop.split(';')

        teams << team_a
        teams << team_b

        case result
        when 'win'
          wins << team_a
          losses << team_b
        when 'loss'
          wins << team_b
          losses << team_a
        when 'draw'
          draws << team_a
          draws << team_b
        end

      end
      [teams.uniq, wins.tally, draws.tally, losses.tally]
    end

    def tally_results(teams, wins, draws, losses)
      teams.map do |team|
        { team: team,
          win: wins.fetch(team, 0),
          draw: draws.fetch(team, 0),
          loss: losses.fetch(team, 0) }
      end
    end
  end
end
