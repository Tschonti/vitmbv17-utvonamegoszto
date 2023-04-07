json.extract! route, :id, :name, :link, :distance, :elevation, :created_at, :updated_at
json.url route_url(route, format: :json)
