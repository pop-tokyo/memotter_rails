class CreateUserRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :user_relationships do |t|
      t.references :user, foreign_key: true, null: false
      t.references :follower, foreign_key: { to_table: :users }, null: false
      t.timestamps
      t.index [:user_id, :follower_id], unique: true
    end
  end
end
