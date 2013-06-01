require 'pry'

class Board
  NODE_TYPES = {
    'S' => 'S',
    'F' => 'F',
    '-' => '+',
  }

  def initialize board
    @row_count = board.size
    @column_count = board.first.size

    @graph = UndirectedGraph.new
    @nodes = create_nodes board
    connect_nodes
  end

  def dump_graph
    graph.dump do |v|
      "(#{v[:row]}, #{v[:col]})"
    end
  end

  def dump &blk
    BoardDumper.new(self).dump &blk
  end

  attr_reader :graph, :start_node, :end_node, :nodes

  private

  def create_nodes board
    board.map.with_index do |row, row_i|
      row.map.with_index do |cell, cell_i|
        type = NODE_TYPES[cell]
        node = type ? Node.new(row: row_i, col: cell_i, type: type) : nil
        @start_node  = node if type == 'S'
        @end_node    = node if type == 'F'
        node
      end
    end
  end

  def connect_nodes
    for row in 0..@row_count-1 do
      for col in 0..@column_count-1 do
        connect row, col, row, col+1
        connect row, col, row+1, col
      end
    end
  end

  def connect row1, col1, row2, col2
    return unless @nodes[row1] && @nodes[row1][col1] && @nodes[row2] && @nodes[row2][col2]

    @graph.add @nodes[row1][col1], 1, @nodes[row2][col2]
  end
end
