class AddSentenceIndexToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :sentence_index, :integer
  end
end
