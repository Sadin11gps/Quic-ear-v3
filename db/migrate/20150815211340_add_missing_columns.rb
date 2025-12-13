class AddMissingColumns < ActiveRecord::Migration
	def change
		add_column :users, :agent_id, :integer
		add_column :agents, :preferred_employee, :string
	end
end
