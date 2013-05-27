class Graph
  def initialize
    @g = {}
  end

  def rels node
    related_nodes = @g[node]
    return [] unless related_nodes

    related_nodes.map do |other_node, rel_value|
      Relationship.new node, rel_value, other_node
    end
  end

  def add start_node, rel, end_node
    @g[start_node] ||= {}
    @g[start_node][end_node] = rel
  end

  def dump
    lines = []
    @g.each do |node, rels|
      rels.each do |other_node, rel_value|
        lines << "#{node.value} ---#{rel_value}--> #{other_node.value}"
      end
    end
    return lines.join "\n"
  end

  private
end

class Node
  def initialize value
    @value = value
  end

  attr_accessor :value
end

class Relationship
  def initialize start_node, value, end_node
    @start_node, @value, @end_node =
      start_node, value, end_node
  end

  attr_reader :start_node, :end_node
  attr_accessor :value
end
