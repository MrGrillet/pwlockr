class CreateClientPassword < ActiveRecord::Migration[5.1]
  def change
    create_table :client_passwords do |t|
      t.belongs_to :client, foreign_key: true
      t.belongs_to :password, foreign_key: true
    end
  end
end
