class CreateCircuitExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :circuit_exercises do |t|
      t.references :circuit, foreign_key: true
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
