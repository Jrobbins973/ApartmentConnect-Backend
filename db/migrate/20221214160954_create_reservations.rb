class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :tenant_id
      t.string :ammenity
      t.datetime :date_reserved
      t.string :description
      t.boolean :approved

      t.timestamps
    end
  end
end
