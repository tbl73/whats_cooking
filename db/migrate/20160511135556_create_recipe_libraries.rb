class CreateRecipeLibraries < ActiveRecord::Migration
  def change
    create_table :recipe_libraries do |t|
      t.integer :recipe_id
      t.integer :library_id

      t.timestamps null: false
    end
  end
end
