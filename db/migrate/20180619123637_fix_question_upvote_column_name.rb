class FixQuestionUpvoteColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :question_upvotes, :answer_id, :question_id
  end
end
