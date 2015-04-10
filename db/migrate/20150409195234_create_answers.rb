class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.belongs_to :question
      t.belongs_to :answerer

      t.timestamps null: false
    end
  end
end
