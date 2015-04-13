class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :response
  has_many :votes, as: :point

  def self.sort_newest
    Question.all.sort_by{|question| question.created_at}.reverse
  end

end
