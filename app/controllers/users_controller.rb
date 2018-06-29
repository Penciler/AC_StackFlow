class UsersController < ApplicationController
	def show
		@user=User.find(params[:id])
		if @user.answers != nil
			@user_answer=@user.answers.order(upvotes_count: :asc).last
		end

	end

	def edit
		@user=User.find(params[:id])
	end

    def update
    	@user=User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

	private

    def user_params
	    params.require(:user).permit(:name, :email)
	end
end
