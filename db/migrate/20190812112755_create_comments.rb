class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :memo, foreign_key: true
      t.text :content, null: false
      t.boolean :edit
      t.timestamps
    end
  end
end
