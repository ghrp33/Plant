class CreatePlantes < ActiveRecord::Migration[7.0]
  def change
    create_table :plantes do |t|
      t.string :name
      t.float :price
      t.string :variety

      t.timestamps
    end
  end
end
