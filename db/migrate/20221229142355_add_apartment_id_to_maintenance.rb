class AddApartmentIdToMaintenance < ActiveRecord::Migration[7.0]
  def change
    add_column :maintenance_requests, :tenant_id, :integer
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
