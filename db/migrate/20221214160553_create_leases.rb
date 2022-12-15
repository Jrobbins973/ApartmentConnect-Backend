class CreateLeases < ActiveRecord::Migration[7.0]
  def change
    create_table :leases do |t|
      t.integer :apartment_id
      t.integer :tenant_id
      t.datetime :move_out_date
      t.datetime :move_in_date
      t.boolean :pets
      t.integer :pet_count
      t.datetime :lease_start
      t.datetime :lease_end
      t.integer :rent
      t.datetime :rent_duedate

      t.timestamps
    end
  end
end
