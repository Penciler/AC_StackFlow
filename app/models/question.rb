class Question < ApplicationRecord
  has_many :question_upvotes
  has_many :upvote_users, through: :question_upvotes, source: :user

  has_many :favorites
  has_many :favorite_users, through: :upvote_users, source: :user
end
