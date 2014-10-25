class AddChallengeDayToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :challenge_day, :integer
  end
end
