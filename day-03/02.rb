file_path = 'input'
input = ""

File.foreach(file_path) do |line|
  input = line
end

mul_regex = /mul\(\d+,\d+\)/
do_regex = /do\(\)/
dont_regex = /don't\(\)/

matches = input.scan(/#{mul_regex}|#{do_regex}|#{dont_regex}/)

total = 0
mul_enabled = true

matches.each do |match|
  if match.match(do_regex)
    mul_enabled = true
  elsif match.match(dont_regex)
    mul_enabled = false
  elsif mul_enabled && (mul_match = match.match(/mul\((\d+),(\d+)\)/))
    num1 = mul_match[1].to_i
    num2 = mul_match[2].to_i
    total += (num1 * num2)
  end
end

puts total