#!/usr/bin/env ruby

require 'test/unit'
require_relative 'test_helper'
require 'conways'

include Test::Unit

class ConwaysTest < TestCase
  def test_cell_with_fewer_than_two_live_neighbours_dies
    grid = {
      [1, 1] => 1
    }
    assert_empty grid_for_next_tick(grid)
  end
  
  def test_live_cell_with_more_than_three_live_neighbours_dies
    grid = {
      [1,1] => 1,
      [1,2] => 1,
      [1,0] => 1,
      [0,0] => 1,
      [0,1] => 1
    }
    fail 'should be dead' if grid_for_next_tick(grid).has_key?([1,1])
  end
  
  def test_cell_with_two_live_neighbours_lives
    grid = {
      [1,1] => 1,
      [1,2] => 1,
      [1,0] => 1
    }
    assert grid_for_next_tick(grid).has_key?([1,1]) 
  end
  
  def test_dead_cell_with_three_neighbours_should_live
    grid = {
      [1,2] => 1,
      [1,0] => 1,
      [0,0] => 1
    }
    assert grid_for_next_tick(grid).has_key?([1,1])
  end
  
  def test_dead_cell_with_two_neighbours_should_stay_dead
    grid = {
      [1,2] => 1,
      [0,0] => 1
    }
    fail 'should stay dead' if grid_for_next_tick(grid).has_key?([1,1])
  end
  
  def test_dead_cell_with_two_neighbours_dies
    grid = {
      [0,0] => 1,
      [0,1] => 1
    }
    fail 'should be dead' if grid_for_next_tick(grid).has_key?([1,1])
  end
  
  def test_empty_grid_doesnt_fail
    assert_empty grid_for_next_tick({})
  end
end
  