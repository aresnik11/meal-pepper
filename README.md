# 🌶 Meal Pepper 🌶

Flatiron Module 2 Final Project developed by [Amy Resnik](https://github.com/aresnik11) and [Tracie Masek](https://github.com/traciemasek)

Meal Pepper is an end to end Rails app where users can sign up/log in and search a database of recipes to add to custom meal plans. Users can create, edit, and delete meal plans. In addition to recipes, users can also search for wines to add to new or existing meal plans. 

Users have the option to email a copy of their shopping list to themselves, which is a list of all the ingredients from each recipe saved to their weekly meal plans.

## 📌 Features

+ Users can sign up, log in, and log out
+ User auth handled with bcrypt and sessions
+ Users can search recipes by meal type or by a key word in the recipe's title
+ Users can create named meal plans. They can edit and delete meal plans.
+ Users can add recipes to an existing meal plan, or create a new one on the spot
+ Users can also search wines by varietal, price range, or key word and add wines to meal plans as well
+ Users can view a grocery list, which is all the ingredients from each of their saved recipes. We implemented ActionMailer to allow the user to email themselves a copy of the grocery list.
+ Employs Rails validations and nested routes

## 🛠 Built With

+ Ruby on Rails
+ Sqlite
+ bcrypt
+ ActionMailer
+ Semantic UI CSS

## 💻 Supported Versions

+ Ruby 2.6.1
+ Rails 6.0.0
+ SQLite3 1.4
+ bcrypt 3.1.7

## 📷 Preview Images

The recipes index page where users can filter by meal type or seach by key word

![recipes index page filter](https://live.staticflickr.com/65535/49127740461_4ded295586_b.jpg)

![recipes index page search](https://live.staticflickr.com/65535/49127739961_81445f4473_b.jpg)

The wines index page with filter and search options

![wines index page](https://live.staticflickr.com/65535/49127739416_a35d3dbe61_b.jpg)

User dashboard with saved meal plan cards 

![user dashboard](https://live.staticflickr.com/65535/49127249953_b7a3a74289_b.jpg)

Grocery list with option to email

![grocery list](https://live.staticflickr.com/65535/49127924842_5669c40373_b.jpg)


