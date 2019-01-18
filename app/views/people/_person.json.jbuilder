json.extract! person, :id, :fn, :ln, :email, :created_at, :updated_at
json.url person_url(person, format: :json)
