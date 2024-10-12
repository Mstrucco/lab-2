class AddUserToPosts < ActiveRecord::Migration[7.2]
  def change
    add_reference :posts, :user, foreign_key: true # Remove null: false for now
  end
end
