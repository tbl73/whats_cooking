class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :name
      t.integer :mealplan_id

      t.timestamps null: false
    end
  end
end
