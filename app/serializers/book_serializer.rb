
class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :edition, :genre, :rating, :publisher, :image_url

end

