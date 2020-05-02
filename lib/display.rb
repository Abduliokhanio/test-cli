require_relative "scraper.rb"

class Display

  @@general_url = "https://store.steampowered.com/search/?specials=1"
  @@casual_url = "https://store.steampowered.com/search/?specials=1&tags=597"
  @@simulation_url = "https://store.steampowered.com/search/?specials=1&tags=599"
  @@indie_url = "https://store.steampowered.com/search/?specials=1&tags=492"
  @@adventure_url = "https://store.steampowered.com/search/?specials=1&tags=21"
  @@action_url = "https://store.steampowered.com/search/?specials=1&tags=19"

  def initialize
  end

  def self.welcome
      puts "Hi! Welcome to the Steam Clearance CLI!"
      puts ''
  end

  def self.selection
    puts "Please select the genre you would like to explore:"
    puts "1 : General"
    puts "2 : Casual"
    puts "3 : Simulation"
    puts "4 : Indie"
    puts "5 : Adventure"
    puts "6 : Action"
    puts "q : Exit"
    puts ''
  end

  def self.selection2
    puts "What would you like more information about?"
  end

  def self.logic
    boogie_woogie = true

    while boogie_woogie == true
      input = gets.chomp

      if input == '1'
        self.output1(input)
        genral
        loopy
        description
      elsif input == '2'
        self.output1(input)
        casual
        loopy
        description
      elsif input == '3'
        self.output1(input)
        simulation
        loopy
        description
      elsif input == '4'
        self.output1(input)
        indie
        loopy
        description
      elsif input == '5'
        self.output1(input)
        adventure
        loopy
        description
      elsif input == '6'
        self.output1(input)
        action
        loopy
        description
      elsif input == "q"
        puts ""
        puts "Bye for now!"
        puts ""
        boogie_woogie = false
      else
        puts "That's not an option."
        selection
      end

    end
  end

  def self.description
    boogie_woogie = true

    selection2

    while boogie_woogie == true
      input = gets.chomp

      if input == '1'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == '2'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == '3'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == '4'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == '5'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == '6'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == '7'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == '8'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == '9'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == '10'
        more_info(input.to_i - 1)
        puts''
        loopy

      elsif input == "q"
        puts ""
        puts "Going Back to Genres!"
        puts ""
        boogie_woogie = false
        Game.destroy
        selection
      else
        puts "That's not an option."
      end

    end
  end

  def self.output1(val)
    if val == '1'
      sit = 'Genral'
    elsif val == '2'
      sit = 'Casual'
    elsif val == '3'
      sit = 'Simulation'
    elsif val == '4'
      sit = 'Indie'
    elsif val == '5'
      sit = 'Adventure'
    elsif val == '6'
      sit = 'Action'
    end


    puts ''
    puts "                              Top 10 #{sit}"
    puts ''
    puts "Rank  |  Title  |  Original Price  |  Percent off  |  Discounted Price"
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"


  end

  def self.more_info(num)
    puts ""
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "#{Game.all[num].title}"
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts '                              Snip Bit'
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    if Game.all[num].snip_bit == "" 
      Game.all[num].snip_bit = "Snip Bit Not Listed"
    end
    puts Game.all[num].snip_bit
    puts ''
    puts '                              Game Review'
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    if Game.all[num].game_review == "" 
      Game.all[num].game_review = "Game Review Not Listed"
    end
    puts Game.all[num].game_review
    puts ''
    puts '                              Description'
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    if Game.all[num].des == "" 
      Game.all[num].des = "Description Not Listed"
    end
    puts Game.all[num].des
    puts ''
    puts '                        Minimum System Requirement'
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    if Game.all[num].min_req == "" 
      Game.all[num].min_req = "Minimum System Requirement Not Listed"
    end
    puts Game.all[num].min_req
    puts ''
    puts '                         Maximum System Requirement'
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    if Game.all[num].rec_req == "" 
      Game.all[num].rec_req = "Maximum System Requirement Not Listed"
    end
    puts Game.all[num].rec_req
    puts ''
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts ''
    selection2

  end

  def self.loopy
    epoc = 0
    while epoc < 10

      title =  Game.all[epoc].title
      original_price = Game.all[epoc].original_price
      percent_off = Game.all[epoc].percent_off
      discounted_price = Game.all[epoc].discounted_price

      puts "#{epoc + 1}  |  #{title}  | Original Price: $#{original_price}  | Percent off: #{percent_off}  | Discounted Price: $#{discounted_price}"
      puts ""
      epoc += 1
    end
    puts "q : Exit"
    puts ''
  end

  def self.genral
    genral = Scraper.new(@@general_url)
    genral.collecter
  end

  def self.casual
    casual = Scraper.new(@@casual_url)
    casual.collecter
  end

  def self.simulation
    simulation = Scraper.new(@@simulation_url)
    simulation.collecter
  end

  def self.indie
    indie = Scraper.new(@@indie_url)
    indie.collecter
  end

  def self.adventure
    adventure = Scraper.new(@@adventure_url)
    adventure.collecter
  end

  def self.action
    action = Scraper.new(@@action_url)
    action.collecter
  end

  def self.run
    welcome
    selection
    logic rescue connection_fail
  end 

  def self.connection_fail
    puts ''
    puts "Sorry, steam server did not accept the request. Please try again."
    puts ''
    run
  end 

end

Display.run