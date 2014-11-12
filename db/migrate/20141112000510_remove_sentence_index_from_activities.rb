class RemoveSentenceIndexFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :sentence_index, :integer
  end
end
