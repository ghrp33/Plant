class AddUserToPlantes < ActiveRecord::Migration[7.0]
  def change
    add_reference :plantes, :user, null: false, foreign_key: true
  end
end
