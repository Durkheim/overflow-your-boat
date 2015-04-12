class Vote < ActiveRecord::Base
  belongs_to :point, polymorphic: true

  def up_vote
  end

  def down_vote
  end
end

