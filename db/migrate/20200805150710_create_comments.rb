class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, index: true
      t.belongs_to :potin, index: true

      t.timestamps
    end
  end
end
