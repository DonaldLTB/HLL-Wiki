class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.time :start_time
      t.time :end_time
      t.date :day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
