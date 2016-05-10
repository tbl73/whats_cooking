class AddLibraryIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :library_id, :string
  end
end
