class AddEuropeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :europe, :boolean, default: false
  end
end
