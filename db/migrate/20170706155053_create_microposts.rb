class CreateMicroposts < ActiveRecord::Migration[5.0]
  def change
    create_table :microposts do |microposts|
      microposts.text :content
      microposts.references :user, foreign_key: true

      microposts.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
