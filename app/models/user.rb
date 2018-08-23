require 'pry'
class User < ActiveRecord::Base
  has_many :reading_cards

  def welcome
    w = TTY::Prompt.new.select("Tarot house.") do |menu|
         menu.choices "Existing User" => "existing", "New User" => "newuser", Exit: "exit"
     end

     case w
       when "existing"
         user = existing
       when "newuser"
         user = new_user
       when "exit"
         lucky_number
         exit
       end
     puts `clear`
     menu(user)
  end

  def existing
    puts "Please enter your name:"
    username = gets.downcase.chomp
      if !User.exists?(name: username)
        puts "We don't have a #{username} on file. Would you like to create a new account?"
        user = new_user(username)
      else
        user = User.find_by(name: username)
      end
      user
  end

  def new_user username = nil
    puts "Please enter your name:"
    username = gets.downcase.chomp
    if User.find_by(name: username.downcase)
      puts `clear`
      puts "Username already exists."
      welcome
    end
    User.create(name: username)
  end

  def main_menu(hash)
    # hash[:display] = "" if hash[:display].nil?
    choice = TTY::Prompt.new.select(hash[:display]) do |menu|
      menu.choices hash[:choices]
    end
    choice
  end

  def menu(user)
    user = User.find(user.id)
    choice = main_menu display: "Select option:",
                      choices: {
                        "Read My Tarot" => "read",
                        "Tarot History" => "history",
                        "Log Out" => "exit"
                      }
    case choice
      when "read"
        puts "What would you like to know today?"
        category_menu(user)
      when "history"
        history(user)
      when "exit"
        lucky_number
        exit
      end
    end


  def new_reading_card(user, found_card)
    rc = ReadingCard.create(user_id: user.id, card_id: found_card.id, date: Date.today)
    rc.save
    rc
  end

  def category_menu(user)
    puts `clear`
    w = TTY::Prompt.new.select("#{user.name}") do |menu|
      menu.choices "Love" => "love", "Future" => "future", "Career" => "career", "Self" => "self", "Back" => "back"
   end

   case w
     when "love"
       found_card = nil
       num = Random.rand(0..4)
       Card.love_cards.each_with_index do |c, i|
         if i == num
           found_card = c
         end
       end

     when "future"
       found_card = nil
       num = Random.rand(0..4)
       Card.future_cards.each_with_index do |c, i|
         if i == num
           found_card = c
         end
       end

     when "career"
       found_card = nil
       num = Random.rand(0..4)
       Card.career_cards.each_with_index do |c, i|
         if i == num
           found_card = c
         end
       end

     when "self"
       found_card = nil
       num = Random.rand(0..4)
       Card.love_cards.each_with_index do |c, i|
         if i == num
           found_card = c
         end
       end

     when "back"
       menu(user)
     end
     puts found_card.name
     puts found_card.saying
     new_reading_card(user, found_card)
     menu(user)
  end

  def readings(user)
    ReadingCard.select {|rc| rc.user_id == user.id}
  end

  def cards(user)
    users_cards = Hash.new(0)
    Card.all.each do |c|
      readings(user).each do |r|
        if r.card_id == c.id
          users_cards[c] = r.id
        end
      end
    end
    users_cards
  end

  def card_names(user)
    names = []
    cards(user).each {|k,v| names << k.name}
    names
  end

  def card_sayings(user)
    cards(user).map {|c| c.saying}
  end

  def categories(user)
    cards(user).map {|c| c.category}
  end



  def history(user)
    # terminal-table
    # Date | Name | Category | Saying | Lucky Numbers
    # rows = []
    # for i = 0..readings.size-1
    # rows << ["#{readings[i].date}", "card_names"]
    readings = ReadingCard.all.select {|rc| rc.user == user}
    binding.pry
    puts readings
  end

  def lucky_number
    puts `clear`
    puts "Thank you for visiting Tarot House."
    puts "Here are your lucky numbers:"
    puts 3.times.map { Random.rand(200) }
  end


end
