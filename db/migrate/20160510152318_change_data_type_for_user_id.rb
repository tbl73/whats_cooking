class ChangeDataTypeForUserId < ActiveRecord::Migration
   def self.up
     change_table :recipes do |r|
         r.change :user_id, :integer
     end
 end

 def self.down
     change_table :recipes do |r|
         r.change :user_id, :string
     end
 end
end
