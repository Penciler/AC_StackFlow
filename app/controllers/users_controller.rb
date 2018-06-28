class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit]
	def show
		@user=User.find(params[:id])
	end

	def edit
		@user=User.find(params[:id])
		if @user.id != current_user.id
			redirect_to edit_user_path(current_user)
		end
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
