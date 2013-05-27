require_relative '../lib/graph.rb'

describe UndirectedGraph do
  subject { UndirectedGraph.new }

  let(:a) { Node.new 'a' }
  let(:b) { Node.new 'b' }

  context 'with two nodes and one edge' do
    before { subject.add(a, 3, b) }

    its(:dump) do
      should == [
        'a ---3--> b',
        'b ---3--> a'
      ].join("\n")
    end

    its(:nodes) { should == [a, b] }
  end
end
