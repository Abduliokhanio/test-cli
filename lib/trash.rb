require 'nokogiri'
require 'open-uri'
#require 'httparty'
require 'pry'


url = "https://store.steampowered.com/search/?specials=1"
html = open(url)
@doc = Nokogiri::HTML(open(html))

new_url = @doc.css("a.search_result_row")[0]["href"] # getting the link
html = open(new_url)
@doc2_deep_info = Nokogiri::HTML(open(html))

des = @doc2_deep_info.css("div.game_area_description").text.split.join(' ')


puts des