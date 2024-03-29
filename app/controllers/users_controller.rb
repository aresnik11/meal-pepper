class UsersController < ApplicationController
    skip_before_action :authorized?, only: [:new, :create]
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :limit_view, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.username.downcase!
        if @user.save
            flash[:notice] = "Successfully created account"
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.now[:messages] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @meal_plans = @user.meal_plans
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Successfully updated account"
            redirect_to user_path(@user)
        else
            flash[:messages] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        @user.delete_meal_plans
        @user.delete
        flash[:notice] = "Successfully deleted account"
        redirect_to signup_path
    end

    private

    def limit_view
        if current_user.id != params[:id].to_i
            # flash[:messages] = ''
            redirect_to user_path(current_user)
        end
    end

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email_address, :username, :password, :password_confirmation, :vegetarian)
    end
end
