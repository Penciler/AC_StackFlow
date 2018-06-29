class ChangeUserTwiterTwitter < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :twiter, :twitter
  end
end
