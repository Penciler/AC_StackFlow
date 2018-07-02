class ModifyQuestionUpvote < ActiveRecord::Migration[5.1]
  def change
  	remove_column :questions, :upvotes_count, :integer
  	add_column :questions, :question_upvotes_count, :integer
  end
end
