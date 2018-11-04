class TeamClient < ApplicationRecord
  belongs_to :team
  belongs_to :client
end
