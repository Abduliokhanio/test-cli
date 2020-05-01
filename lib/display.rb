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

  def welcome
      puts "Hi! Welcome to the Steam Clearance CLI!"
  end

  def selection
    puts "Please select the genre you would like to explore:"
    puts "1 : General"
    puts "2 : Casual"
    puts "3 : Simulation"
    puts "4 : Indie"
    puts "5 : Adventure"
    puts "6 : Action"
  end

  def logic
    boogie_woogie = true

    while boogie_woogie == true
      input = gets.chomp

      if input == '1'
        self.output1(input)
        genral
        loopy
      elsif input == '2'
        self.output1(input)
        casual
        loopy
      elsif input == '3'
        self.output1(input)
        simulation
        loopy
      elsif input == '4'
        self.output1(input)
        indie
        loopy
      elsif input == '5'
        self.output1(input)
        adventure
        loopy
      elsif input == '6'
        self.output1(input)
        action
        loopy
      elsif input == "q"
        puts "Bye for now!"
        boogie_woogie = false
      else
        puts "That's not an option."
        selection
      end

    end
  end

  def output1(val)
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
    puts "Count  |  Title  |  Original Price  |  Percent off  |  Discounted Price"
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"


  end

  def loopy
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
    Game.destroy
  end

  def genral
    genral = Scraper.new(@@general_url)
    genral.collecter
  end

  def casual
    casual = Scraper.new(@@casual_url)
    casual.collecter
  end

  def simulation
    simulation = Scraper.new(@@simulation_url)
    simulation.collecter
  end

  def indie
    indie = Scraper.new(@@indie_url)
    indie.collecter
  end

  def adventure
    adventure = Scraper.new(@@adventure_url)
    adventure.collecter
  end

  def action
    action = Scraper.new(@@action_url)
    action.collecter
  end

end


uno = Display.new
uno.welcome
uno.selection
uno.logic
