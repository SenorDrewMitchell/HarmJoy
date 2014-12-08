class AddEmbedableCodeToMoments < ActiveRecord::Migration
  def change
    add_column :moments, :embedable_code, :text
  end
end
