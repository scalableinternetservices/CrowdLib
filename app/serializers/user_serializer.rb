
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstname, :lastname, :email, :password, :address, :lender_rating, :borrower_rating

end

