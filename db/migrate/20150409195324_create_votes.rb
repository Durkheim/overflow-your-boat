class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :like
       t.references :point, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
