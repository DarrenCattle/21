class AddUnsuscribeFromEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unsuscribe_from_reminder_email, :boolean, default: false
  end
end
