class AddQuestionUpvotesCount < ActiveRecord::Migration[5.1]
  def change
  	add_column :questions, :upvotes_count, :integer
  end
end
