class Simulator
  COMMANDS = { L: :turn_left,
               R: :turn_right,
               A: :advance }.freeze

  def instructions(string)
    string.scan(/\w/)
          .map(&:to_sym)
          .map { |command| COMMANDS[command] }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instruction_string)
    instructions(instruction_string).each do |command|
      robot.send(command)
    end
  end
end

class Robot
  DIRECTIONS = %i[east west north south].freeze

  attr_reader :bearing, :coordinates

  def initialize
    @bearing = nil
    @coordinates = [nil, nil]
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)

    @bearing = direction
  end

  def at(x_ordinate, y_ordinate)
    @coordinates = [x_ordinate, y_ordinate]
  end

  def advance
    @coordinates = case bearing
                   when :north
                     coordinates.tap { |coords| coords[1] += 1 }
                   when :east
                     coordinates.tap { |coords| coords[0] += 1 }
                   when :south
                     coordinates.tap { |coords| coords[1] -= 1 }
                   when :west
                     coordinates.tap { |coords| coords[0] -= 1 }
                   end
  end

  def turn_right
    @bearing = case bearing
               when :north
                 :east
               when :east
                 :south
               when :south
                 :west
               when :west
                 :north
               end
  end

  def turn_left
    @bearing = case bearing
               when :north
                 :west
               when :west
                 :south
               when :south
                 :east
               when :east
                 :north
               end
  end
end

