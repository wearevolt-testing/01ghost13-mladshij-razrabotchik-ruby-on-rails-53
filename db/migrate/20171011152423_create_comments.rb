class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false

      t.datetime :published_at
      t.datetime :updated_at
    end
  end
end
