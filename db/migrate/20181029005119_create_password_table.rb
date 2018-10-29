class CreatePasswordTable < ActiveRecord::Migration[5.1]
  def change
    create_table :passwords do |t|
      t.string :name
      t.string :username
      t.string :password
      t.text :description
      t.text :note
      t.belongs_to :tenant, foreign_key: true

      t.timestamps
    end
  end
end
