class Card < ActiveRecord::Base
  has_many :reading_cards
  has_many :users, through: :reading_cards

  def self.love_cards
    Card.all.select do |c|
      c.category == "love"
    end
  end

  def self.future_cards
    Card.all.select do |c|
      c.category == "future"
    end
  end

  def self.career_cards
    Card.all.select do |c|
      c.category == "career"
    end
  end

  def self.self_cards
    Card.all.select do |c|
      c.category == "self"
    end
  end



end
