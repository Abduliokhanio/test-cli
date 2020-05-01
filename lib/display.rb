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
  end

end


uno = Display.new
uno.welcome
uno.selection
uno.logic
