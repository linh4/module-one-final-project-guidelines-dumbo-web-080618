class ReadingCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
end

## meow ##
# - love
# judgement - future
# the world - career
# the high priestess - self

## dog ##
# love - Strength (card_id: 10) *id: 101
# future - High priestess
# career - temperance
# self - strength (card_id: 10) *id: 104
# self - strength (card_id: 10) <- 
