class AddUsernameAboutToContributor < ActiveRecord::Migration
  def change
    add_column :contributors, :user_name, :string
    add_column :contributors, :about, :text
  end
end
