class CreateReadingCardsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :reading_cards do |t|
      t.integer :user_id
      t.integer :card_id
      t.datetime :date 
    end
  end
end
