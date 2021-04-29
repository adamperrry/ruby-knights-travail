require_relative 'move_node'

# A doubley-linked tree containing all possible one-way paths from a starting position.
# Paths cannot contain a position contained by another path, including their own.

# I tried building out a tree where each path can contain points from other paths,
# but not their own, and the result was... woof. Exponential.
class PathTree
  attr_reader :root, :board, :piece
  def initialize(piece:, start_at: piece.position)
    @piece = piece
    @board = piece.board
    build_tree(start_at)
  end

  def level_search(position:)
    queue = [root]
    current_node = queue.pop
    until current_node.position == position
      current_node.next_moves.each { |move| queue.unshift(move) }
      current_node = queue.pop
      return nil unless current_node
    end
    current_node
  end

  private

  def build_tree(starting_position)
    return nil unless piece

    @root = MoveNode.new(position: starting_position)
    queue = [root]
    until queue.empty?
      current_node = queue.pop
      next_moves = get_next_moves(current_node)
      next_moves.each do |move|
        node = MoveNode.new(position: move, previous_move: current_node)
        queue.unshift(node)
        current_node.next_moves << node
      end
    end
  end

  def get_next_moves(node)
    piece.moves.map { |move| [move[0] + node.position[0], move[1] + node.position[1]] }
         .keep_if { |move| valid?(move) && level_search(position: move).nil? }
  end

  def valid?(move)
    move[0].between?(0, board.width) && move[1].between?(0, board.height)
  end
end
