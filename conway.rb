#!/usr/bin/env ruby

require_relative 'lib/conways'

ROWS = 40
COLS = 100

def seed_grid
  grid = {}
  (0 .. COLS).each do |x|
    (0 .. ROWS).each do |y|
      grid[[x, y]] = 1 if (Random.rand > 0.5)
    end
  end
  grid
end

grid = seed_grid
while true
  system 'clear'
  (0 .. ROWS).each do |y|
    line = ""
    (0 .. COLS).each do |x|
      char = grid.has_key?([x, y]) ? "X" : " "
      line << char
    end
    puts line
  end
  grid = grid_for_next_tick(grid)
  # sleep 0.4
end

puts "ok"