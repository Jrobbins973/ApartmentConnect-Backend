class CreateMaintenanceRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenance_requests do |t|
      t.integer :apartment_id
      t.string :description
      t.string :urgency
      t.boolean :completed
      t.string :completed_by

      t.timestamps
    end
  end
end
