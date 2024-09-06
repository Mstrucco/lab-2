class AddPostIdToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :post, foreign_key: true, null: true
  end
end
