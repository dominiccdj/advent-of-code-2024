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

file_path = '02-input'
reports = []

File.foreach(file_path) do |line|
  numbers = line.split.map(&:to_i)
  reports << numbers
end

count = 0

for r in reports
  if check_order(r) == "OK" && check_difference(r) == "OK"
    count += 1
  end
end

puts count
