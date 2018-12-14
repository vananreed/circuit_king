class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :length
      t.integer :calories
      t.integer :interval
      t.references :user, foreign_key: true
      t.references :circuit, foreign_key: true

      t.timestamps
    end
  end
end
