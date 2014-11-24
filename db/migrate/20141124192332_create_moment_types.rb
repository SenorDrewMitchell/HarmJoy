class CreateMomentTypes < ActiveRecord::Migration
  def change
    create_table :moment_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
