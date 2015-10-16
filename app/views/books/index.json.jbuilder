json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :edition, :genre, :rating, :publisher, :image_url
  json.url book_url(book, format: :json)
end
