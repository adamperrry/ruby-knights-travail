class MoveNode
  attr_accessor :position, :previous_move, :next_moves
  def initialize(position: nil, previous_move: nil, next_moves: [])
    @position = position
    @previous_move = previous_move
    @next_moves = next_moves
  end
end
