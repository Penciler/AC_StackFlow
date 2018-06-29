class AnswersController < ApplicationController
  def answer_upvote
    @answer = Answer.find(params[:id])
    @answer.answer_upvotes.create!(user:current_user)
    redirect_back(fallback_location: question_path)  
  end
end
