class CreateUserLibraries < ActiveRecord::Migration
  def change
    create_table :user_libraries do |t|
      t.integer :user_id
      t.integer :library_id

      t.timestamps null: false
    end
  end
end
