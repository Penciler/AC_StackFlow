class AddQuestionColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :subject, :string
    add_column :questions, :content, :string
    add_column :questions, :user_id, :integer
  end
end
