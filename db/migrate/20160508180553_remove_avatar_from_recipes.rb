class RemoveAvatarFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :avatar, :string
  end
end
