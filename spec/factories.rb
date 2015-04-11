require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    username "Test_User"
    email  "email@email.com"
    password "password"
    location "Chicago"
  end

  factory :question do
    title "What is Travis CI?"
    description "Seriously, what is it?"
  end

  factory :question_comment, class: Comment do
    message "This is a comment on a question."
  end

  factory :answer do
    content "This is a sample answer! Lots of smart things here!"
  end

  factory :answer_comment, class: Comment do
    message "This is a comment on an answer."
  end
end
