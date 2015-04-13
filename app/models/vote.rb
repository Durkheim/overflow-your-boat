class Vote < ActiveRecord::Base
  belongs_to :point, polymorphic: true


end

