class AddUpvotesCount < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :upvotes_count, :integer
  end
end
