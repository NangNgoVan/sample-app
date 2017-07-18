class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |relationship|
      relationship.integer :follower_id
      relationship.integer :followed_id

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
