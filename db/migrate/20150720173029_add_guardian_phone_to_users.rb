class AddGuardianPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guardian_phone_number, :string
  end
end
