def parse_input(path)
  return File.read(path)
end


def find_valid_mults(memory)
  total = 0
  mult_regex = /mul\(\d{1,3},\d{1,3}\)/
  matches = memory.scan(mult_regex)
  matches.each do |match|
    nums = match.scan(/\d{1,3}/)
    total += nums[0].to_i * nums[1].to_i
  end
  return total
end

def find_valid_do_mults(filename)
  all_instructs = []
  File.foreach(filename) do |line|
    match = line.scan(/don't\(\)|do\(\)|mul\(\d{1,3},\d{1,3}\)/)
    all_instructs << match
  end
  all_instructs.flatten!
  is_enabled = true
  total = 0

  all_instructs.each do |instruct|
    if instruct == "do()"
      is_enabled = true
    elsif instruct == "don't()"
      is_enabled = false
    elsif instruct.include?("mul")
      nums = instruct.scan(/\d{1,3}/)
      if is_enabled
        total += nums[0].to_i * nums[1].to_i
      end
    end
  end
  return total
end


if __FILE__ == $0
  mem = parse_input(File.join(Dir.pwd,"instructions.txt"))
  puts find_valid_mults(mem)
  puts find_valid_do_mults(File.join(Dir.pwd,"instructions.txt"))
end