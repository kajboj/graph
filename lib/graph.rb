class Graph
  def initialize
    @graph = {}
    @nodes = []
  end

  def rels node
    related_nodes = @graph[node]
    return [] unless related_nodes

    related_nodes.map do |other_node, rel_value|
      Relationship.new node, rel_value, other_node
    end
  end

  def add start_node, rel, end_node
    add_nodes start_node, end_node

    @graph[start_node] ||= {}
    @graph[start_node][end_node] = rel
  end

  def dump &blk
    lines = []
    @graph.each do |node, rels|
      node_string = block_given? ? yield(node.value) : node.value
      rels.each do |other_node, rel_value|
        other_node_string = block_given? ? yield(other_node.value) : other_node.value
        lines << "#{node_string} ---#{rel_value}--> #{other_node_string}"
      end
    end
    return lines.join "\n"
  end

  attr_reader :nodes

  private

  def add_nodes *nodes
    @nodes += nodes
    @nodes.uniq!
  end
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

class UndirectedGraph < Graph
  def add start_node, rel, end_node
    super start_node, rel, end_node
    super end_node,   rel, start_node
  end
end
