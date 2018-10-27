class ChangeRemoveForeignkeyFromUserTeams < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :user_teams, :projects
  end
end
