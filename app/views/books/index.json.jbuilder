json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :edition, :genre, :ratings, :image_url, :publisher, :ISBN
  json.url book_url(book, format: :json)
end
