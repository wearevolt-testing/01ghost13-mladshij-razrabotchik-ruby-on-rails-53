class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname, :password, null: false
      t.string :email, null: false, unique: true

      t.timestamps
    end
  end
end
