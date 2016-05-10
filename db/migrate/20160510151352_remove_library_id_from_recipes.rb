class RemoveLibraryIdFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :library_id, :string
  end
end
