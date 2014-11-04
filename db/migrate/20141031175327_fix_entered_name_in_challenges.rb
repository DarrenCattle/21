class FixEnteredNameInChallenges < ActiveRecord::Migration
  def change
  	rename_column :challenges, :entered?, :entered
  end
end
