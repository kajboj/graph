require_relative '../lib/grid.rb'

class BoardDumper
  def initialize board
    @board = board
  end

  def dump &blk
    grid = Grid.new height, width, 2, 2

    each_node do |node, row, col|
      render_node grid, row, col, &blk
    end

    grid.to_s
  end

  private

  def height
    nodes.size
  end

  def width
    nodes.first.size
  end

  def render_node grid, row, col, &blk
    node = nodes[row][col]
    return unless node

    from_block = block_given? ? yield(node) : nil

    top = from_block || node.value[:type]
    top += right(row, col) ? '-'  : ' '
    bottom = lower(row, col) ? '| ' : '  '

    grid.fill row, col, [top, bottom]
  end

  def nodes
    @board.nodes
  end

  def right row, col
    nodes[row][col+1]
  end

  def lower row, col
    return unless nodes[row+1]
    nodes[row+1][col]
  end

  def each_node &blk
    nodes.map.with_index do |row, row_i|
      row.each.with_index do |node, node_i|
        yield node, row_i, node_i
      end
    end
  end
end
