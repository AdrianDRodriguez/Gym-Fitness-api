class CreateExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :video_url

      t.timestamps
    end
  end
end
