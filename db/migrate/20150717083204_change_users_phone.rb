class ChangeUsersPhone < ActiveRecord::Migration
  def change
  	change_column_default :users, :phone, ""
  end
end
