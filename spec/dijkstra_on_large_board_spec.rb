require_relative '../lib/graph.rb'
require_relative '../lib/board.rb'
require_relative '../lib/board_dumper.rb'
require_relative '../lib/dijkstra.rb'

describe 'Dijkstra on large board' do
  let(:board) do
    board = []
    16.times do |r|
      32.times do |c|
        board[r] ||= []
        board[r][c] = %w(X - - - - -).sample
      end
    end

    board[0][0] = 'S'
    board[board.size-1][board.first.size - 1] = 'F'
    Board.new board
  end

  let(:board1) do
    Board.new([
      %w(X X - - - F),
      %w(X X - X X X),
      %w(X X - X X X),
      %w(X X - - - -),
      %w(X X - X X -),
      %w(S - - - - -),
    ])
  end

  let(:graph) { board.graph }

  let(:subject) do
    Dijkstra.new graph, board.start_node, board.end_node
  end

  specify do
    dumper = BoardDumper.new board

    subject.run do |graph, current_node, unvisited|
      # s = dumper.dump do |node|
      #   'x' if node.value[:visited]
      # end
      # puts s
      # sleep 0.05
    end

    path = subject.shortest_path

    s = dumper.dump do |node|
      if path.include? node
        'O'
      elsif node.value[:visited]
        'x'
      end
    end
    puts s

    puts "shortest path length = #{subject.shortest_path_length}"
  end
end
