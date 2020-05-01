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

      elsif input == '2'

      elsif input == '3'

      elsif input == '4'

      elsif input == '5'

      elsif input == '6'

      elsif input == "q"
        puts "Bye for now!"
        boogie_woogie = false
      else
        puts "That's not an option."
        selection
      end

    end



  end


  def output
  end

end


uno = Display.new
uno.welcome
uno.selection
uno.logic
