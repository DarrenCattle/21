class AddDefaulValueToDayAttribute < ActiveRecord::Migration
  def up
  		remove_column :challenges, :day, :integer
  		add_column :challenges, :day, :integer, default: 0
	end

	def down
  		remove_column :challenges, :day, :integer, default: 0
  		add_column :challenges, :day, :integer
	end
end
