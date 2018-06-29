class Question < ApplicationRecord
  validates :subject, :presence => true # 一定要有標題
  validates :user_id, :presence => true # 一定要有user id

  has_many :question_upvotes
  has_many :upvote_users, through: :question_upvotes, source: :user

  has_many :favorites
  has_many :favorite_users, through: :upvote_users, source: :user

  has_many :answers
  belongs_to :user
  
end
