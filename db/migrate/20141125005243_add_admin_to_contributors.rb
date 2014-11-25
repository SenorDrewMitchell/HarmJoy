class AddAdminToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :admin, :boolean, :default => false
  end
end
