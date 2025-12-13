class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :organisation
      t.string :organisation_type
      t.string :email
      t.string :password_digest
      t.string :address

      t.timestamps
    end
  end
end
