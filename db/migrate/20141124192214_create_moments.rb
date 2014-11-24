class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string :name
      t.text :description
      t.string :source
      t.decimal :lat
      t.decimal :long
      t.integer :parent_moment_id
      t.integer :moment_type_id
      t.integer :asset_id
      t.date :race_date_id
      t.boolean :active

      t.timestamps
    end
  end
end
