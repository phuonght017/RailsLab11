class CreateFriendNum < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_nums do |t|
      t.integer :num
      t.string :str_out

      t.timestamps
    end
  end
end
