class AddQuestionAttribute < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :user_id, :string
    add_column :questions, :subject, :string
    add_column :questions, :content, :text
  end
end
