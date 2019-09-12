class IngredientsController < ApplicationController
  def index
    @mp_rec_ings = current_user.ingredients_by_meal_plan

    if params[:email]
      UserMailer.grocery_list_email(current_user, current_user.ingredients_by_meal_plan).deliver_now
      flash[:messages] = "Email Sent"
      redirect_to user_ingredients_path(current_user)
    end
  end
end
