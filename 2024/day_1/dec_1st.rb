def parse_input(path)
  left_list = []
  right_list = []
  File.foreach(path) do |line|
    content = line.split(" ")
    left_list << content[0].to_i
    right_list << content[1].to_i
  end
  return left_list, right_list
end

# Part 1
def total_distance_calc(filename)
  left_list, right_list = parse_input(File.join(Dir.pwd,filename))

  total_distance = 0

  left_list.sort!
  right_list.sort!

  left_list.each_with_index do |left, index|
    total_distance += (right_list[index] - left).abs
  end
  return total_distance
end

# Part 2
def similarity_calc(filename)
  left_list, right_list = parse_input(File.join(Dir.pwd,filename))
  right_count = Hash.new(0)

  right_list.each do |right|
    right_count[right] +=1
  end

  total_similarity = 0
  left_list.each do |left|
    total_similarity += left * right_count[left]
  end
  return total_similarity
end

if __FILE__ == $0
  puts total_distance_calc("input.txt")
  puts similarity_calc("input.txt")
end