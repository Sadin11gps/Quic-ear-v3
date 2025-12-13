class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :mob_num
      t.boolean :available
      t.string :preferred_jobs
      t.string :password_digest
      t.string :preferred_location
      t.decimal :experience
      t.decimal :ratings

      t.timestamps
    end
  end
end
