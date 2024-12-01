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


def total_distance_calc()
  left_list, right_list = parse_input(File.join(Dir.pwd,"input.txt"))

  total_distance = 0

  left_list.sort!
  right_list.sort!

  left_list.each_with_index do |left, index|
    right = right_list[index]
    total_distance += (right - left).abs
  end
  return total_distance
end

def similarity_calc()
  left_list, right_list = parse_input(File.join(Dir.pwd,"input.txt"))
  right_count = {}

  right_list.each do |right|
    if right_count[right]
      right_count[right] += 1
    else
      right_count[right] = 1
    end
  end

  total_similarity = 0
  left_list.each do |left|
    if right_count[left]
      total_similarity += left * right_count[left]
    end
  end
  return total_similarity
end

puts total_distance_calc()
puts similarity_calc()

