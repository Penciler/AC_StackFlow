class AddUpvoteCountDefault < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :answers, :answer_upvotes_count, 0
  	change_column_default :questions, :question_upvotes_count, 0
  end
end
