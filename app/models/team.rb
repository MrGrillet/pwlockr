class Team < ApplicationRecord
  belongs_to :tenant
  validates_uniqueness_of :name
  validate :free_plan_can_only_have_one_team

  def free_plan_can_only_have_one_team
    if self.new_record? && (tenant.teams.count > 0) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than one team")
    end
  end

  def self.by_user_plan_and_tenant(tenant_id)
    tenant = Tenant.find(tenant_id)
    if tenant.plan == 'premium'
      tenant.teams
    else
      tenant.teams.order(:id).limit(1)
    end
  end
end
