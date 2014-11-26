class AddIsDefaultToTags < ActiveRecord::Migration
  def change
    add_column :tags, :is_default, :boolean, :default => false
  end
end
