class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, :body, null: false
      t.belongs_to :user, index: true, foreign_key: true

      t.datetime :published_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
