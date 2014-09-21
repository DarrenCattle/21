class AddEnteredToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :entered?, :boolean
  end
end
