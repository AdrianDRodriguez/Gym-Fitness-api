class CreateWods < ActiveRecord::Migration[8.0]
  def change
    create_table :wods do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.integer :reps

      t.timestamps
    end
  end
end
