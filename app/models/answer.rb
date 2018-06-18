class Answer < ApplicationRecord
  belongs_to :user

  has_many :answer_upvotes
  has_many :upvote_users, through: :answer_upvotes, source: :user
end
