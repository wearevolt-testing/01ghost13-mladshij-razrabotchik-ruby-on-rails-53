class ChangeNullComment < ActiveRecord::Migration[5.0]
  def change
    change_column_null :comments, :published_at, false
    change_column_null :comments, :updated_at, false
  end
end
