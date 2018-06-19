class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  has_many :answer_upvotes
  has_many :upvote_users, through: :answer_upvotes, source: :user
end
