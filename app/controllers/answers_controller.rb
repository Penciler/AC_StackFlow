class AnswersController < ApplicationController

  before_action :authenticate_user!, only: [:answer_upvote,:create,:destroy]

  def answer_upvote
    @answer = Answer.find(params[:id])
    @answer.answer_upvotes.create!(user:current_user)
    @answer.save
    redirect_back(fallback_location: question_path)  
  end

  def create
    #params.require(:answer).permit(:description, :user_id)
    @user = current_user
    @question = Question.find(params[:id])
    @answer = current_user.answers.build(answer_params)

    if @answer.save
      flash[:notice] = "answer was successfully created"
    else
      flash[:alert] = "answer was failed to create"
      flash[:alert] = @answer.errors.full_messages
      #flash[:alert] = @question.id
    end
    redirect_back(fallback_location: questions_path)
  end

  def destroy
    @answer = Question.find(params[:id])
    @answer.destroy
    redirect_to(answers_path)  # answers page
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :intro, :role, :image, :name)
    end

    def answer_params #還是不太懂require的功能要確定一下
      params.require(:answer).permit( :content, :user_id, :question_id, :created_at, :updated_at)
    end

end
