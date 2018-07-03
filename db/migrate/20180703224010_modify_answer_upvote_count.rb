class ModifyAnswerUpvoteCount < ActiveRecord::Migration[5.1]
  def change
  	remove_column :answers, :upvotes_count, :integer
  	add_column :answers, :answer_upvotes_count, :integer
  end
end
