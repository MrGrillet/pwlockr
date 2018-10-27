class ChangeProjectIdToTeamIdInUserTeams < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_teams, :project_id, :team_id
  end
end
