class AddPostToComments < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to(:comments, :post)
  end
end
