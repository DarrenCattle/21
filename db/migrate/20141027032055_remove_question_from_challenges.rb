class RemoveQuestionFromChallenges < ActiveRecord::Migration
  def change
    remove_column :challenges, :question, :string
  end
end
