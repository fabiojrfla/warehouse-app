class ChangeFullAddressToAddressInSupplier < ActiveRecord::Migration[7.0]
  def change
    rename_column :suppliers, :full_address, :address
  end
end
