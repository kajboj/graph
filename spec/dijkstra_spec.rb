require_relative '../lib/graph.rb'
require_relative '../lib/dijkstra.rb'

describe Dijkstra do
  let(:graph) do
    Graph.new.tap do |g|
      g.add 1,  7, 2
      g.add 1,  9, 3
      g.add 1, 14, 6
      g.add 2,  7, 1
      g.add 2, 10, 3
      g.add 2, 15, 4
      g.add 3,  9, 1
      g.add 3, 10, 2
      g.add 3, 11, 4
      g.add 3,  2, 6
      g.add 4, 15, 2
      g.add 4, 11, 3
      g.add 4,  6, 5
      g.add 5,  6, 4
      g.add 5,  9, 6
      g.add 6, 14, 1
      g.add 6,  2, 3
      g.add 6,  9, 5
    end
  end

  let(:subject) do
    Dijkstra.new graph, 1, 5
  end

  its(:shortest_path_length) { should == 20 }
end
