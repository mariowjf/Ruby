file = File.new('file1.txt', 'w')
file.close

File.open('file1.txt', 'r') do |file|
  
end