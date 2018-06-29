class AnswersController < ApplicationController

  def create
    #params.require(:answer).permit(:description, :user_id)
    @user = current_user
    #@answer = Tweet.new(answer_params)
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question

    if @answer.save
      flash[:notice] = "answer was successfully created"
    else
      flash[:alert] = "answer was failed to create"
    end
    redirect_back(question_path(@question))
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

    def check_userself
      if current_user!=@user
      redirect_to restaurants_path
      flash[:alert] = "您無編輯權限！"
      end
    end

    def set_question
      @question = Question.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit( :content, :user_id, :question_id, :created_at, :updated_at)
    end

end
