class Password < ApplicationRecord
  belongs_to :tenant
  validates_presence_of :name
end
