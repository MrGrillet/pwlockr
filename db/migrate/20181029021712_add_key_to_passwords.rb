class AddKeyToPasswords < ActiveRecord::Migration[5.1]
  def change
    add_column :passwords, :key, :string
  end
end
