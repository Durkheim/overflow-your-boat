class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, class_name: "User"
  has_many :comments, as: :response
  has_many :votes, as: :point
end
