require_relative 'path_tree'

class Knight
  attr_reader :board, :color
  attr_accessor :position

  def initialize(board:, position: [1, 0], color: 'white')
    @board = board
    @position = position
    @color = color
  end

  def moves
    [[1, 2], [-2, -1], [-1, 2], [2, -1], [1, -2], [-2, 1], [-1, -2], [2, 1]]
  end

  def move_knight(start_at: position, end_at:)
    paths = PathTree.new(piece: self, start_at: start_at)
    destination = paths.level_search(position: end_at)
    print_path_to(destination)
  end

  private

  # should probably be in the PathTree class, but oh well
  def print_path_to(node)
    path = []
    until node.nil?
      path.unshift(node.position)
      node = node.previous_move
    end
    puts "The shortest path took #{path.length - 1} moves! Here's your path:"
    path.each { |position| p position }
  end
end
