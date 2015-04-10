class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.belongs_to :commenter
      t.references :response, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
