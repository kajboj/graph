class Dijkstra
  def initialize graph, start_node, end_node
    @graph, @start_node, @end_node =
      graph, start_node, end_node
  end

  def run
    set_distance_on_all_nodes_to_infinity
    mark_all_nodes_unvisited

    current_node = @start_node
    set_distance current_node, 0.0

    while (current_node != @end_node) && (get_distance(current_node) != Float::INFINITY)
      current_distance = get_distance current_node

      @graph.rels(current_node).each do |rel|
        node = rel.end_node
        unless visited?(node)
          new_distance = current_distance + rel.value

          if new_distance < get_distance(node)
            set_distance node, new_distance
            set_previous node, current_node
          end
        end
      end
      mark_visited current_node
      current_node = pick_unvisited_node
      yield(@graph, current_node, @unvisited) if block_given?
    end
  end

  def shortest_path_length
    get_distance @end_node
  end

  def shortest_path
    path = [@end_node]
    while path.last != @start_node
      path << path.last.value[:previous]
    end
    path.reverse
  end

  private

  def dump
    s = @graph.dump do |v|
      d = v[:distance]
      [v[:name], d.infinite? ? 'inf' : d].join': '
    end
    puts s
  end

  def visited? node
    !@unvisited.include?(node)
  end

  def mark_visited node
    @unvisited.delete node
    node.value[:visited] = true
  end

  def mark_all_nodes_unvisited
    @unvisited = @graph.nodes.dup
  end

  def pick_unvisited_node
    @unvisited.min_by do |node|
      get_distance node
    end
  end

  def set_distance_on_all_nodes_to_infinity
    @graph.nodes.each do |node|
      unless node.value.is_a? Hash
        node.value = { name: node.value }
      end
      node.value[:distance] = Float::INFINITY
    end
  end

  def set_distance node, distance
    node.value[:distance] = distance
  end

  def set_previous node, previous_node
    node.value[:previous] = previous_node
  end

  def get_distance node
    node.value[:distance]
  end
end
