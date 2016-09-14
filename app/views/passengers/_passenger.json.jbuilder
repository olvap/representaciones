json.extract! passenger, :id, :name, :documento, :nacimiento, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)