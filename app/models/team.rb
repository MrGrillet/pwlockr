class Team < ApplicationRecord
  belongs_to :tenant
  has_many :passwords, dependent: :destroy

  has_many :user_teams
  has_many :users, through: :user_teams

  validates_uniqueness_of :name
  validate :free_plan_can_only_have_one_team

  def free_plan_can_only_have_one_team
    if self.new_record? && (tenant.teams.count > 0) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than one team")
    end
  end

  def self.by_user_plan_and_tenant(tenant_id, user)
    tenant = Tenant.find(tenant_id)
    if tenant.plan == 'premium'
      if user.is_admin?
        tenant.teams
      else
        user.teams.where(tenant_id: tenant.id)
      end
    else
      if user.is_admin?
        tenant.teams.order(:id).limit(1)
      else
        user.teams.where(tenant_id: tenant.id).order(:id).limit(1)
      end
    end
  end
end
