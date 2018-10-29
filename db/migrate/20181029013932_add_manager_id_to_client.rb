class AddManagerIdToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :manager_id, :integer
  end
end
