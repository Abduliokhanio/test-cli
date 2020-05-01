require_relative "scraper.rb"

class Display

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
      elsif input == '2'
        self.output1(input)
      elsif input == '3'
        self.output1(input)
      elsif input == '4'
        self.output1(input)
      elsif input == '5'
        self.output1(input)
      elsif input == '6'
        self.output1(input)
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

    loopy
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
  end

end


uno = Display.new
uno.welcome
uno.selection
uno.logic
