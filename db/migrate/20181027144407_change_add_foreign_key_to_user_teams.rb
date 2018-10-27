class ChangeAddForeignKeyToUserTeams < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :user_teams, :teams
  end
end
