json.extract! client, :id, :name, :description, :tenant_id, :created_at, :updated_at
json.url client_url(client, format: :json)
