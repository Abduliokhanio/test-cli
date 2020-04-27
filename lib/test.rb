require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'pry'

  html = open("https://store.steampowered.com/search/?specials=1")
  doc = Nokogiri::HTML(open(html))


  #doc.css("div.responsive_search_name_combined")[0].text.split                       # array
  #doc.css("span.title")[0].text                                                      # title
  #doc.css("div.responsive_search_name_combined")[0].text.split[-1].split("$")[1]     # origional price
  #doc.css("div.responsive_search_name_combined")[0].text.split[-1].split("$")[2]     # discounted price
  #doc.css("div.responsive_search_name_combined")[0].text.split[-2]                   # Percent off

  #doc.css("span.title")[0].text #title



  puts doc.css("span.title")[0].text
  puts doc.css("div.responsive_search_name_combined")[0].text.split[-1].split("$")[1]
  puts doc.css("div.responsive_search_name_combined")[0].text.split[-1].split("$")[2]
  puts doc.css("div.responsive_search_name_combined")[0].text.split[-2]
