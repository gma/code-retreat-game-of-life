def grid_for_next_tick(grid)
  next_grid = {}
  min_x, max_x, min_y, max_y = extents_of_grid(grid)
  return {} if min_x.nil? or min_y.nil?
  for_cells_between(min_x, min_y, max_x, max_y) do |x, y|
    next_grid[[x, y]] = 1 if alive_on_next_tick?(grid, [x, y])
  end
  next_grid
end

def alive?(grid, cell)
  grid.has_key?(cell)
end

def alive_on_next_tick?(grid, cell)
  x, y = cell
  living_neighbours = 0
  for_cells_between(x - 1, y - 1, x + 1, y + 1) do |i, j|
    next if x == i and y == j
    living_neighbours += 1 if grid.has_key?([i, j])
  end
  if alive?(grid, cell)
    living_neighbours >= 2 and living_neighbours < 4
  else
    living_neighbours == 3
  end
end

def extents_of_grid(grid)
  min_x = grid.keys.map { |x, y| x }.min
  max_x = grid.keys.map { |x, y| x }.max
  min_y = grid.keys.map { |x, y| y }.min
  max_y = grid.keys.map { |x, y| y }.max
  [min_x, max_x, min_y, max_y]
end

def for_cells_between(min_x, min_y, max_x, max_y)
  (min_x .. max_x).each do |x|
    (min_y .. max_y).each do |y|
      yield x, y
    end
  end
end
