class ChangingDateToStringInTenant < ActiveRecord::Migration[7.0]
  def change

    change_column :leases, :rent_duedate, :string
    change_column :leases, :lease_end, :string
    change_column :leases, :move_out_date, :string
    change_column :leases, :rent, :string

  end
end
