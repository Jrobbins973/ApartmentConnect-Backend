class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :layout
      t.string :apartment_number
      t.boolean :occupied

      t.timestamps
    end
  end
end
