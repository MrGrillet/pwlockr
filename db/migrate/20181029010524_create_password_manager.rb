class CreatePasswordManager < ActiveRecord::Migration[5.1]
  def change
    create_table :password_managers do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :password, foreign_key: true
    end

    create_table :password_teams do |t|
      t.belongs_to :team, foreign_key: true
      t.belongs_to :password, foreign_key: true
    end
  end
end
