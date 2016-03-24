
puts "/users/mario/desktop/ruby"
puts File.join('', 'users', 'mario', 'desktop', 'ruby')

puts __FILE__

puts File.expand_path(__FILE__)

puts File.dirname(__FILE__)

puts File.join(File.dirname(__FILE__), '..', "exercise\ Files")