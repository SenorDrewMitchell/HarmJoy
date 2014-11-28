class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string :name
      t.text :description
      t.string :source
      t.decimal :lat
      t.decimal :long
      t.date :race_day_id
      t.boolean :active

      t.timestamps
    end
  end
end
