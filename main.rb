# This solution is a little more verbose than other solutions on The Odin Project
# The idea was to build somewhat reusable classes using a more OOP approach
# Efficiency could be improved by stopping the tree building once the goal is met,
# but that seemed a bit too specific to the problem to implement. I wanted a whole tree!
require_relative 'board'
require_relative 'knight'

knight = Knight.new(board: Board.new)
knight.move_knight(start_at: [3, 3], end_at: [4, 3])
knight.move_knight(start_at: [0, 0], end_at: [7, 4])
knight.move_knight(start_at: [0, 0], end_at: [7, 7])
