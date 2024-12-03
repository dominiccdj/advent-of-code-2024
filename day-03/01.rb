file_path = 'input'
input = ""

File.foreach(file_path) do |line|
  input = line
end

regex = /mul\(\d+,\d+\)/

matches = input.scan(regex)

total = 0

matches.each do |match|
  pattern = /mul\((\d+),(\d+)\)/
  matched = match.match(pattern)

  if matched
    num1 = matched[1].to_i 
    num2 = matched[2].to_i
    total += (num1*num2)
  end
end

puts total
