class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, class_name: "User"
  has_many :comments, as: :response
  has_many :votes, as: :point

   def answer_vote_total
    dislike = self.votes.where(like: false).count
    self.votes.count - dislike
  end

end
