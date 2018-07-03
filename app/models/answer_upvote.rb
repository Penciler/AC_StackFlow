class AnswerUpvote < ApplicationRecord
  belongs_to :answer, :counter_cache => true
  belongs_to :user
end
