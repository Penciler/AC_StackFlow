class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true
  validates :email, :presence => true

  has_many :questions
  has_many :answers
  # 收藏的文章
  has_many :favorites
  has_many :favorites_questions, through: :favorites, source: :questions

  # 按別人讚的question
  has_many :question_upvotes
  has_many :upvoted_questions, through: :question_upvotes, source: :questions

  # 按別人讚的answer
  has_many :answer_upvotes
  has_many :upvoted_answers, through: :answer_upvotes, source: :answers

  # 被按讚的question
  has_many :inverse_question_upvotes, class_name: 'QuestionUpvote', foreign_key: 'question_id'
  has_many :been_upvoted_questions, through: :inverse_question_upbotes, source: :question

  # 被按讚的answer
  has_many :inverse_answer_upvotes, class_name: 'AnswerUpvote', foreign_key: 'answer_id'
  has_many :been_upvoted_answers, through: :inverse_answer_upbotes, source: :answer

  def is_admin?
    self.role == 'admin'
  end

end
