class CreateRaceDays < ActiveRecord::Migration
  def change
    create_table :race_days do |t|
      t.string :name
      t.date :race_date
      t.integer :race_id

      t.timestamps
    end
  end
end
