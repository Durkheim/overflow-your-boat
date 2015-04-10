class Comment < ActiveRecord::Base
  belongs_to :response, polymorphic: true
end
