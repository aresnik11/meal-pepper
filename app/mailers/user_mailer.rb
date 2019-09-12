class UserMailer < ApplicationMailer
 
    def grocery_list_email(user, grocery_list)
        @user = user
        @grocery_list = grocery_list
        mail(to: @user.email_address, subject: 'Your Grocery List')
    end
end
