json.array!(@users) do |user|
  json.extract! user, :id, :username, :firstname, :lastname, :email, :password, :address, :lender_rating, :borrower_rating
  json.url user_url(user, format: :json)
end
