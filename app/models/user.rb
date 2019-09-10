class User < ApplicationRecord
    has_many :meal_plans
    has_secure_password
    validates :first_name, :last_name, :username, :password, :password_confirmation, :email_address, presence: true
    validates :username, uniqueness: { case_sensitive: false }
    # validates :meal_plans.name, uniqueness: true

    def full_name
        self.first_name + " " + self.last_name
    end

    def delete_meal_plans
        self.meal_plans.each do |meal_plan|
          meal_plan.delete
        end
      end
end
