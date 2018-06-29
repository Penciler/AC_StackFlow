class UserAddInfoColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company, :string
    add_column :users, :title, :string
    add_column :users, :github, :string
    add_column :users, :twiter, :string
    add_column :users, :website, :string
  end
end
