def check_order(report)
  return "OK" if report == report.sort || report == report.sort.reverse
  "Unordered"
end

def check_difference(report)
  (0..report.size-2).each do |i|
    diff = (report[i] - report[i+1]).abs
    return "Not OK" if diff < 1 || diff > 3
  end
  "OK"
end

def is_safe(report)
  return true if check_order(report) == "OK" && check_difference(report) == "OK"
  
  report.each_with_index do |_, index|
    modified_report = report[0...index] + report[(index+1)..-1]
    return true if check_order(modified_report) == "OK" && check_difference(modified_report) == "OK"
  end
  
  false
end

file_path = 'input-sample'
reports = []

File.foreach(file_path) do |line|
  numbers = line.split.map(&:to_i)
  reports << numbers
end

count = 0

reports.each do |report|
  count += 1 if is_safe(report)
end

puts count