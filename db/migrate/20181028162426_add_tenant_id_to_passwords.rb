class AddTenantIdToPasswords < ActiveRecord::Migration[5.1]
  def change
    add_reference :passwords, :tenant_id, index: true
  end
end
