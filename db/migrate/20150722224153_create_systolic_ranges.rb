class CreateSystolicRanges < ActiveRecord::Migration
  def change
    create_table :systolic_ranges do |t|
      t.integer :high
      t.integer :medium
      t.integer :low
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
