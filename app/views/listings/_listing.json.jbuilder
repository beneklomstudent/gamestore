json.extract! listing, :id, :gamename, :listingname, :users_id, :created_at, :updated_at, :price, :status
json.url listing_url(listing, format: :json)
