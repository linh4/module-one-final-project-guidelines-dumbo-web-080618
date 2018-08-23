require_relative '../config/environment'

puts `clear`
User.new.welcome

#######################################################
# history ->


# i = 0..readings.size-1
# menu.choices "#{date} | #{category} | #{name} | #{lucky_nums}" => i
# w = TTY::Prompt.new.select("History") do |menu|
#   menu.choices "#{readings[i].date} | #{categories} | #{card_names(user)[i]} | #{lucky_nums}" => i,
# end
