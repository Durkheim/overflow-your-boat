class User < ActiveRecord::Base

  has_secure_password

  has_many :questions

  has_many :answered_questions, class_name: "Answer", foreign_key: :answerer_id
  has_many :comments_provided, class_name: "Comment", foreign_key: :commenter_id

  validates :username, :uniqueness => true
  validates :email, :uniqueness => true, :format => /.+@.+\..+/
end
