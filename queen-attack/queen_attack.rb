class Queens
  DEFAULT = {white: [0, 3], black: [7, 3]}

  attr_reader :white, :black

  def initialize(placement = {})
    @white = placement.fetch(:white) { DEFAULT[:white] }
    @black = placement.fetch(:black) { DEFAULT[:black] }
    fail ArgumentError if @white == @black
  end

  def to_s
    (0..7).each do |row|
      (0..7).each do |col|
        if [row, col] == white
          print 'W '
        elsif [row, col] == black
          print 'B '
        else
          print '_ '
        end
      end
      puts ''
    end
  end

  def attack?
    same_row? || same_col? || same_diagonal?
  end

  def same_row?
    white[0] == black[0]
  end

  def same_col?
    white[1] == black[1]
  end

  def same_diagonal?
    (white[1] - white[0]).abs == (black[1] - black[0]).abs
  end
end

