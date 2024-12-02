# Part 1
def count_safe_reports_1(filename)
  safe_count = 0
  File.foreach(File.join(Dir.pwd,filename)) do |line|
    report = line.split(" ").map(&:to_i)
    if is_safe(report)
      safe_count += 1
    end
  end
  return safe_count
end



# Part 2
def count_safe_reports_2(filename)
  safe_count = 0
  File.foreach(File.join(Dir.pwd,filename)) do |line|
    report = line.split(" ").map(&:to_i)
    for i in 0..report.length-1
      new_report = report.dup()
      new_report.delete_at(i)
      if is_safe(new_report)
        safe_count += 1
        break
      end
    end
  end
  return safe_count
end


def is_safe(report)
  return report.each_cons(2).all? { |a, b| a >= b && (a-b).abs <= 3 && (a-b).abs > 0 } || report.each_cons(2).all? { |a, b| a <= b  && (a-b).abs <= 3 && (a-b).abs > 0 }
end


if __FILE__ == $0
  puts count_safe_reports_1("reports.txt")
  puts count_safe_reports_2("reports.txt")
end