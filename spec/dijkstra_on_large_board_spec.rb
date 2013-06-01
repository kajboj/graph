require_relative '../lib/graph.rb'
require_relative '../lib/board.rb'
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

    # Board.new([
    #   %w(X X - - - F),
    #   %w(X X - X X X),
    #   %w(X X - X X X),
    #   %w(X X - - - X),
    #   %w(X X X X - X),
    #   %w(S - - - - X),
    # ])
  end

  let(:graph) { board.graph }

  let(:subject) do
    Dijkstra.new graph, board.start_node, board.end_node
  end

  specify do
    subject.shortest_path_length do |graph, current_node, unvisited|
      s = board.dump do |node|
        node_type = node.value[:type]
        node.value[:visited] ? 'X' : node_type
      end
      puts s
      puts "(#{current_node.value[:row]}, #{current_node.value[:col]})"
      sleep 0.05
    end
  end
end
