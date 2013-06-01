class Grid
  def initialize grid_height, grid_width, cell_height, cell_width
    @grid_width  = grid_width
    @grid_height = grid_height
    @cell_width  = cell_width
    @cell_height = cell_height

    blank_grid
  end

  def to_s
    @rows.map do |row|
      a = Array.new(@cell_height, '')
      row.each do |cell|
        cell.size.times do |i|
          a[i] += cell[i]
        end
      end
      a.join("\n")
    end.join("\n")
  end

  def fill row, col, block
    @rows      ||= []
    @rows[row] ||= []
    @rows[row][col] = block
  end

  private

  def blank_grid
    @grid_height.times do |row|
      @grid_width.times do |col|
        fill row, col, blank_cell
      end
    end
  end

  def blank_cell
    cell = Array.new @cell_height
    @cell_height.times do |i|
      cell[i] = ' ' * @cell_width
    end
    cell
  end
end
