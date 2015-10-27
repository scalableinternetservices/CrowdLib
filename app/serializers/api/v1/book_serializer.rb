
class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :edition, :genre, :ratings, :image_url, :publisher, :ISBN

end

