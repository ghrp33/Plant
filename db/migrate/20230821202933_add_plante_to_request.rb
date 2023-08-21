class AddPlanteToRequest < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :plante, null: false, foreign_key: true
  end
end
