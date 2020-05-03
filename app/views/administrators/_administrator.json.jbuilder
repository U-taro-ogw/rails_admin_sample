json.extract! administrator, :id, :email, :crypted_password, :salt, :created_at, :updated_at
json.url administrator_url(administrator, format: :json)
