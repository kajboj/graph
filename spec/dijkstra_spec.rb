require_relative '../lib/graph.rb'
require_relative '../lib/dijkstra.rb'

describe Dijkstra do
  let(:graph) do
    UndirectedGraph.new.tap do |g|
      g.add n1,  7, n2
      g.add n1,  9, n3
      g.add n1, 14, n6
      g.add n2, 10, n3
      g.add n2, 15, n4
      g.add n3, 11, n4
      g.add n3,  2, n6
      g.add n4,  6, n5
      g.add n5,  9, n6
    end
  end

  let(:subject) do
    Dijkstra.new graph, n1, n5
  end

  its(:shortest_path_length) { should == 20 }

  def n v; Node.new v; end
  let(:n1) { n 1 }
  let(:n2) { n 2 }
  let(:n3) { n 3 }
  let(:n4) { n 4 }
  let(:n5) { n 5 }
  let(:n6) { n 6 }
end
