class AddManagerIdToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :manager_id, :integer
  end
end
