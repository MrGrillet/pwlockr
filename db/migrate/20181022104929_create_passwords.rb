class CreatePasswords < ActiveRecord::Migration[5.1]
  def change
    create_table :passwords do |t|
      t.string :name
      t.string :key
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
