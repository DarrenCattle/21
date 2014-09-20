class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :day, default: 0
      t.string :question
      t.string :reason
      t.integer :user_id

      t.timestamps
    end
  end
end
