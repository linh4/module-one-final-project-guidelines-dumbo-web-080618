require 'pry'
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

  def try_img(num)
    Catpix::print_image "img/pic_#{num}.jpg",
    :limit_x => 1,
    :limit_y => 2,
    :center_x => true,
    :center_y => true,
    :bg => "black",
    :bg_fill => true,
    :resolution => "high"
  end
    
  def card_img(card)
    Card.all.find do |e|
      if e.id == card.id
        try_img(Random.rand(1..3))
      end
    end
  end

end
