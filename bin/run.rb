require_relative '../config/environment'

puts `clear`
User.new.welcome

history ->

w = TTY::Prompt.new.select("History") do |menu|
  menu.choices ""
end
