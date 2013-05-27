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
    ])
  end

  let(:graph) { board.graph }

  let(:subject) do
    Dijkstra.new graph, board.start_node, board.end_node
  end

  specify do
    subject.shortest_path_length do |graph, current_node, unvisited|
      s = board.dump do |node|
        node_type = node.value[:type]
        if node_type == 'o' && node.value[:visited]
          'X'
        else
          node_type
        end
      end
      puts s
    end
  end
end
