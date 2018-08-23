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

  def card_img
    # i = nil
    Card.all.each do |c|
      if c.id == 1
        Catpix::print_image "img/wheel_fortune.png",
          :limit_x => 0.3,
          :limit_y => 0.8,
          :center_x => true,
          :center_y => true,
          :bg => "black",
          :bg_fill => true
        # elsif c.id == 2
        #   i = Catpix::print_image "img/the_sun.png",
        #     :limit_x => 1,
        #     :limit_y => 2,
        #     :center_x => true,
        #     :center_y => true,
        #     :bg => "black",
        #     :bg_fill => true
        end
      end
  end



end
