require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'pry'

  #doc.css("div.responsive_search_name_combined")[0].text.split                       # array
  #doc.css("span.title")[0].text                                                      # title
  #doc.css("div.responsive_search_name_combined")[0].text.split[-1].split("$")[1]     # origional price
  #doc.css("div.responsive_search_name_combined")[0].text.split[-1].split("$")[2]     # discounted price
  #doc.css("div.responsive_search_name_combined")[0].text.split[-2]                   # Percent off

def top_10
  html = open("https://store.steampowered.com/search/?specials=1")
  doc = Nokogiri::HTML(open(html))

  puts "Count  |  Title  |  Original Price  |  Percent off  |  Discounted Price"
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  epoc = 0
  while epoc < 10
    title = doc.css("span.title")[epoc].text
    origional_price =  doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[1]
    discounted_price = doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[2]
    percent_off = doc.css("div.responsive_search_name_combined")[epoc].text.split[-2]

    puts "#{epoc + 1}  |  #{title}  | Original Price: $#{origional_price}  | Percent off: #{percent_off}  | Discounted Price: $#{discounted_price}"
    epoc += 1
  end
end

top_10
