require_relative '../lib/graph.rb'

describe Graph do
  subject { Graph.new }

  let(:a) { Node.new 'a' }
  let(:b) { Node.new 'b' }
  let(:c) { Node.new 'c' }

  describe 'empty' do
    specify { subject.rels(a).should == [] }
  end

  context 'with two nodes and one edge' do
    before { subject.add(a, 3, b) }

    specify { subject.rels(a).count.should == 1 }
    specify { subject.rels(a).first.end_node.should == b }

    its(:dump) { should == 'a ---3--> b' }
  end

  context 'with two nodes and two edges' do
    before do
      subject.add(a, 3, b)
      subject.add(b, 5, a)
    end

    specify { subject.rels(a).count.should == 1 }
    specify { subject.rels(b).count.should == 1 }
    specify { subject.rels(a).first.end_node.should == b }

    its(:dump) do
      should == [
        'a ---3--> b',
        'b ---5--> a'
      ].join("\n")
    end
  end

  context 'with three nodes and two edges (a---->b---->c)' do
    before do
      subject.add(a, 3, b)
      subject.add(b, 5, c)
    end

    specify { subject.rels(a).count.should == 1 }
    specify { subject.rels(b).count.should == 1 }
    specify { subject.rels(c).count.should == 0 }
    specify { subject.rels(a).first.end_node.should == b }
    specify { subject.rels(b).first.end_node.should == c }

    its(:dump) do
      should == [
        'a ---3--> b',
        'b ---5--> c'
      ].join("\n")
    end
  end
end
