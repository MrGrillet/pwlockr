class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.string :image_logo
      t.string :image_hero
      t.belongs_to :tenant, foreign_key: true

      t.timestamps
    end
  end
end
