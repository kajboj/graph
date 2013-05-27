class Dijkstra
  def initialize graph, start_node, end_node
    @graph, @start_node, @end_node =
      graph, start_node, end_node
  end

  def shortest_path_length
    @current_node = @start_node
    @current_node.rels.each do |rel|
      
    end
  end

  private

  def visited?
  end
end
