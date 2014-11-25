class MomentsTags < ActiveRecord::Migration
  def change
    create_table :moments_tags do |t|
      t.integer :moment_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
