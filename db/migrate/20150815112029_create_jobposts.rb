class CreateJobposts < ActiveRecord::Migration
  def change
    create_table :jobposts do |t|
      t.text :job_description
      t.datetime :job_start_date
      t.datetime :job_end_date
      t.string :job_duration
      t.string :job_type
      t.integer :job_budget
      t.integer :employees_req
      t.string :job_location
      t.integer :company_id

      t.timestamps
    end
  end
end
