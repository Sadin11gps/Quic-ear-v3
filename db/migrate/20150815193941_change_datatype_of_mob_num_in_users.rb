class ChangeDatatypeOfMobNumInUsers < ActiveRecord::Migration
  def up
    change_column :users, :mob_num, :string
  end

  def down
    change_column :users, :mob_num, :integer
  end
end
