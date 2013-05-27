require 'pry'

class Board
  NODE_TYPES = {
    'S' => 'S',
    'F' => 'F',
    '-' => 'o',
  }

  def initialize board
    @start_node = Node.new 'S'
    @end_node   = Node.new 'F'

    @graph = UndirectedGraph.new

    nodes = board.map.with_index do |row, row_i|
      row.map.with_index do |cell, cell_i|
        type = NODE_TYPES[cell]
        type ? Node.new(row: row_i, col: cell_i, type: type) : nil
      end
    end

    for row in 0..nodes.size-1 do
      for col in 0..nodes[row].size-1 do
        connect nodes, row, col, row, col+1
        connect nodes, row, col, row+1, col
      end
    end
  end

  def dump_graph
    graph.dump do |v|
      "(#{v[:row]}, #{v[:col]})"
    end
  end

  def dump
  end

  attr_reader :graph, :start_node, :end_node

  private

  def connect nodes, row1, col1, row2, col2
    return unless nodes[row1] && nodes[row1][col1] && nodes[row2] && nodes[row2][col2]

    @graph.add nodes[row1][col1], 1, nodes[row2][col2]
  end
end
