json.extract! listing, :id, :gamename, :listingname, :user_id, :created_at, :updated_at
json.url project_url(listing, format: :json)
