class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :directions
      t.string :category
      t.string :avatar
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
