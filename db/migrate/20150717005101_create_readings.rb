class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :systolic
      t.integer :diastolic
      t.integer :heart_rate
      t.datetime :time 

      t.timestamps null: false
    end
  end
end
