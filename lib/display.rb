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

  def output
  end

end
