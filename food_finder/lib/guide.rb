require 'restaurant'

class Guide
  
  def initialize(path=nil)
    Restaurant.filepath = path
    if Restaurant.file_usable?
      puts "Found restaurant file."
    elsif Restaurant.create_file
      puts "Created restaurant file."
    else
      puts "Exiting.\n\n"
      exit!
    end      
  end
  
  def launch!
    introduction
    result = nil
    until result == :quit
      print "> "
      user_response = gets.chomp
      result = do_action(user_response)
    end    
    conclusion
  end
  
  def do_action(action)
#    puts "action: #{action}"
    case action
    when 'list'
      puts "Listing..."
    when 'find'
      puts "Finding..."
    when 'add'
      puts "Adding..."
    when 'quit'
      return :quit
    else
      puts "\nI don't understand that command.\n"
    end
  end
  
  def introduction
    puts "\n\n<<< Welcom to the Food Finder >>>\n\n"
    puts "This is an interactive guide to help you find the food you crave.\n\n"
  end
  
  def conclusion
    puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
  end
  
end