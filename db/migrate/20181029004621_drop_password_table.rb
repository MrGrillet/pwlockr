class DropPasswordTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :passwords
  end
end
