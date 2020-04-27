require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'pry'

  #doc.css("div.responsive_search_name_combined")[0].text.split                       # array
  #doc.css("span.title")[0].text                                                      # title
  #doc.css("div.responsive_search_name_combined")[0].text.split[-1].split("$")[1]     # origional price
  #doc.css("div.responsive_search_name_combined")[0].text.split[-1].split("$")[2]     # discounted price
  #doc.css("div.responsive_search_name_combined")[0].text.split[-2]                   # Percent off

def welcome
    puts "Hi! Welcome to the Steam Clearance CLI!"
    puts "Please select the genre you would like to explore:"
end

def logic
  input = gets.chomp
  boogie_woogie = true

  while input != 'q'
    if input == 0
      puts top_10_general
      input = gets.chomp
    elsif input == 1
      top_10_casual
      input = gets.chomp
    elsif input == "q"
      puts "Bye for now!"
      break
    end
  end

end

def selection
  puts welcome
  puts "1 : General"
  puts "2 : Casual"
  puts "3 : Simulation"
  puts "4 : Indie"
  puts "5 : Adventure"
  puts "6 : Action"

  logic
end


def top_10_general
  html = open("https://store.steampowered.com/search/?specials=1")
  doc = Nokogiri::HTML(open(html))

  puts ''
  puts "                              Top 10 Overall"
  puts ''
  puts "Count  |  Title  |  Original Price  |  Percent off  |  Discounted Price"
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  epoc = 0
  while epoc < 10
    title = doc.css("span.title")[epoc].text
    origional_price =  doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[1]
    discounted_price = doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[2]
    percent_off = doc.css("div.responsive_search_name_combined")[epoc].text.split[-2]

    puts "#{epoc + 1}  |  #{title}  | Original Price: $#{origional_price}  | Percent off: #{percent_off}  | Discounted Price: $#{discounted_price}"
    puts ""
    epoc += 1
  end
end

def top_10_casual
  html = open("https://store.steampowered.com/search/?specials=1&tags=597")
  doc = Nokogiri::HTML(open(html))

  puts ''
  puts "                              Top 10 Casual"
  puts "Count  |  Title  |  Original Price  |  Percent off  |  Discounted Price"
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  epoc = 0
  while epoc < 10
    title = doc.css("span.title")[epoc].text
    origional_price =  doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[1]
    discounted_price = doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[2]
    percent_off = doc.css("div.responsive_search_name_combined")[epoc].text.split[-2]

    puts "#{epoc + 1}  |  #{title}  | Original Price: $#{origional_price}  | Percent off: #{percent_off}  | Discounted Price: $#{discounted_price}"
    puts ""
    epoc += 1
  end
end

def top_10_simulation
  html = open("https://store.steampowered.com/search/?specials=1&tags=599")
  doc = Nokogiri::HTML(open(html))

  puts ''
  puts "                              Top 10 Simulation"
  puts "Count  |  Title  |  Original Price  |  Percent off  |  Discounted Price"
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  epoc = 0
  while epoc < 10
    title = doc.css("span.title")[epoc].text
    origional_price =  doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[1]
    discounted_price = doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[2]
    percent_off = doc.css("div.responsive_search_name_combined")[epoc].text.split[-2]

    puts "#{epoc + 1}  |  #{title}  | Original Price: $#{origional_price}  | Percent off: #{percent_off}  | Discounted Price: $#{discounted_price}"
    puts ""
    epoc += 1
  end
end

def top_10_indie
  html = open("https://store.steampowered.com/search/?specials=1&tags=492")
  doc = Nokogiri::HTML(open(html))

  puts ''
  puts "                              Top 10 Indie"
  puts "Count  |  Title  |  Original Price  |  Percent off  |  Discounted Price"
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  epoc = 0
  while epoc < 10
    title = doc.css("span.title")[epoc].text
    origional_price =  doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[1]
    discounted_price = doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[2]
    percent_off = doc.css("div.responsive_search_name_combined")[epoc].text.split[-2]

    puts "#{epoc + 1}  |  #{title}  | Original Price: $#{origional_price}  | Percent off: #{percent_off}  | Discounted Price: $#{discounted_price}"
    puts ""
    epoc += 1
  end
end

def top_10_adventure
  html = open("https://store.steampowered.com/search/?specials=1&tags=21")
  doc = Nokogiri::HTML(open(html))

  puts ''
  puts "                              Top 10 Adventure"
  puts "Count  |  Title  |  Original Price  |  Percent off  |  Discounted Price"
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  epoc = 0
  while epoc < 10
    title = doc.css("span.title")[epoc].text
    origional_price =  doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[1]
    discounted_price = doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[2]
    percent_off = doc.css("div.responsive_search_name_combined")[epoc].text.split[-2]

    puts "#{epoc + 1}  |  #{title}  | Original Price: $#{origional_price}  | Percent off: #{percent_off}  | Discounted Price: $#{discounted_price}"
    puts ""
    epoc += 1
  end
end

def top_10_action
  html = open("https://store.steampowered.com/search/?specials=1&tags=19")
  doc = Nokogiri::HTML(open(html))

  puts ''
  puts "                              Top 10 Action"
  puts "Count  |  Title  |  Original Price  |  Percent off  |  Discounted Price"
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  epoc = 0
  while epoc < 10
    title = doc.css("span.title")[epoc].text
    origional_price =  doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[1]
    discounted_price = doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[2]
    percent_off = doc.css("div.responsive_search_name_combined")[epoc].text.split[-2]

    puts "#{epoc + 1}  |  #{title}  | Original Price: $#{origional_price}  | Percent off: #{percent_off}  | Discounted Price: $#{discounted_price}"
    puts ""
    epoc += 1
  end
end

logic
