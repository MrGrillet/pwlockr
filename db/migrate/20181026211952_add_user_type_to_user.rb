class AddUserTypeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_admin, :boolean
    add_column :users, :is_organisation_admin, :boolean
    add_column :users, :is_mamanger, :boolean
  end
end
