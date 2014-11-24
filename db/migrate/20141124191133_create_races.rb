class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.integer :start_day_id
      t.integer :end_day_id

      t.timestamps
    end
  end
end
