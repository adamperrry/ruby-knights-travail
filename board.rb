class Board
  attr_reader :height, :width
  def initialize(height: 7, width: 7)
    @height = height
    @width = width
  end
end
