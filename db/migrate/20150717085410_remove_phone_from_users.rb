class RemovePhoneFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :phone, :integer
    add_column :users, :phone_number, :integer
  end
end
