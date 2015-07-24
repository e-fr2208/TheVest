class RemovePatientReferenceFromReadings < ActiveRecord::Migration
  def change
    remove_reference :readings, :patient, index: true, foreign_key: true
  end
end
