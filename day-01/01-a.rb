file_path = '01-input'
numbers1 = []
numbers2 = []
sum = 0

File.foreach(file_path) do |line|
  pair = line.split.map(&:to_i)
  numbers1 << pair[0] if pair.size == 2
  numbers2 << pair[1] if pair.size == 2 
end

numbers1 = numbers1.sort
numbers2 = numbers2.sort

if numbers1.size != numbers2.size 
  puts "Nooo"
end

for i in 0..numbers1.size-1
  sum += (numbers1[i]-numbers2[i]).abs
end

puts sum