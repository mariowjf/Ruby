require 'restaurant'

class Guide
  class Config
    @@actions = ['list', 'find', 'add', 'quit']
    def self.actions; @@actions; end
  end
  
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
      action = get_action
      result = do_action(action)
    end    
    conclusion
  end

  def get_action
    action = nil
    until Guide::Config.actions.include?(action)
      puts "Actions: " + Guide::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action
  end
  
  def do_action(action)
#    puts "action: #{action}"
    case action
    when 'list'
      list
    when 'find'
      puts "Finding..."
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts "\nI don't understand that command.\n"
    end
  end

def add
  puts "\nAdd a restaurant\n\n".upcase
  
  restaurant = Restaurant.build_using_questions
  
  if restaurant.save
    puts "\nRestaurant Added\n\n"
  else
    puts "\nSave Error: Restaurant not added\n\n"
  end
end

def list
  puts "\nListing restaurants\n\n".upcase
  restaurant = Restaurant.saved_restaurants
  restaurant.each do |rest|
    puts rest.name + " | " + rest.cuisine + " | " + rest.price
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