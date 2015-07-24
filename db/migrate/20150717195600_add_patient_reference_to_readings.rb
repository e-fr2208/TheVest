class AddPatientReferenceToReadings < ActiveRecord::Migration
  def change
    add_reference :readings, :patient, index: true, foreign_key: true
  end
end
