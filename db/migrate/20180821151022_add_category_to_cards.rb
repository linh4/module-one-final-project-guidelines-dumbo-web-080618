class AddCategoryToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :category, :string
  end
end
