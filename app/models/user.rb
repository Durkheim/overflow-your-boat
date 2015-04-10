class User < ActiveRecord::Base
  has_secure_password

  has_many :questions

  has_many :answers_provided, class_name: "Answer", foreign_key: :answerer_id
  has_many :comments_provided, class_name: "Comment", foreign_key: :commenter_id
end
