graph = [
   #  1  2  3  4  5  6
  %w( -  7  9  -  - 14), # 1
  %w( 7  - 10 15  -  -), # 2
  %w( 9 10  - 11  -  2), # 3
  %w( - 15 11  -  6  -), # 4
  %w( -  -  -  6  -  9), # 5
  %w(14  -  2  -  9  -), # 6
].map do |row|
  row.map do |s|
    s == '-' ? nil : s.to_i
  end
end

graph.each.with_index do |node, i|
  node.each.with_index do |length, j|
    puts "#{i+1}---#{length.to_s.rjust(2, '-')}---#{j+1}" if length
  end
end

