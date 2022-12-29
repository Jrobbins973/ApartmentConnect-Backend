class RemoveApartmentFromMaintenance < ActiveRecord::Migration[7.0]
  def change
    remove_column :maintenance_requests, :apartment_id
  end
end
