class Client < ApplicationRecord
  belongs_to :tenant

  has_many :team_clients
  has_many :teams, through: :team_clients

end
