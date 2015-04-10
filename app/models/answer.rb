class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :comments, as: :response
  has_many :votes, as: :point
end
