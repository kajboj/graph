require_relative '../lib/graph.rb'
require_relative '../lib/board.rb'
require_relative '../lib/board_dumper.rb'
require_relative '../lib/dijkstra.rb'

describe Board do
  context '2x2' do
    subject do
      Board.new([
        %w(- F),
        %w(S -),
      ])
    end

    its(:dump_graph) do
      should == [
        '(0, 0) ---1--> (0, 1)',
        '(0, 0) ---1--> (1, 0)',
        '(0, 1) ---1--> (0, 0)',
        '(0, 1) ---1--> (1, 1)',
        '(1, 0) ---1--> (0, 0)',
        '(1, 0) ---1--> (1, 1)',
        '(1, 1) ---1--> (0, 1)',
        '(1, 1) ---1--> (1, 0)',
      ].join("\n")
    end
  end

  context '3x3' do
    subject do
      Board.new([
        %w(x - F),
        %w(- - -),
        %w(S x -),
      ])
    end

    its(:dump) do
      should == [
        '  +-F ',
        '  | | ',
        '+-+-+ ',
        '|   | ',
        'S   + ',
        '      '
      ].join("\n")
    end
  end
end
