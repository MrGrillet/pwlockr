class RenameIsMamangerToIsManager < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :is_mamanger, :is_manager
  end
end
