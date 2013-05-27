require_relative '../lib/graph.rb'
require_relative '../lib/board.rb'
require_relative '../lib/dijkstra.rb'

describe 'Dijkstra on large board' do
  let(:board) do
    Board.new([
      %w(- - - - - F),
      %w(- - - - - -),
      %w(- - - - - -),
      %w(- - - - - -),
      %w(- - - - - -),
      %w(S - - - - -),
    ]).graph
  end

  let(:subject) do
    Dijkstra.new board, start, finish
  end

  specify do
    subject.shortest_path_length do |graph, current_node, unvisited|
      puts 'step'
    end
  end
end
