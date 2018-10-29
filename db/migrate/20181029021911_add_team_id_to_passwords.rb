class AddTeamIdToPasswords < ActiveRecord::Migration[5.1]
  def change
    add_column :passwords, :team_id, :integer
  end
end
