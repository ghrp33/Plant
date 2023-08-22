class AddDescriptionToPlantes < ActiveRecord::Migration[7.0]
  def change
    add_column :plantes, :description, :text
  end
end
