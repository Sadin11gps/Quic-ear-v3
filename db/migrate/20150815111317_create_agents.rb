class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.integer :mob_num
      t.boolean :available
      t.integer :max_emp_count
      t.string :preferred_location
      t.decimal :rating
      t.integer :experience
      t.string :password_digest

      t.timestamps
    end
  end
end
