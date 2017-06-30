class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |user|
      user.string :name
      user.string :email

      user.timestamps
    end
  end
end
