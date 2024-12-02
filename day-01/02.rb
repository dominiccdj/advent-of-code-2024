file_path = '01-input'
numbers1 = []
numbers2 = []
totalSimilarity = 0

File.foreach(file_path) do |line|
  pair = line.split.map(&:to_i)
  numbers1 << pair[0] if pair.size == 2
  numbers2 << pair[1] if pair.size == 2 
end

for n in numbers1
  totalSimilarity += numbers2.count(n) * n
end

puts totalSimilarity