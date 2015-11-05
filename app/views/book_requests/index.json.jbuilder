json.array!(@book_requests) do |book_request|
  json.extract! book_request, :id, :book_id, :lender_id, :borrower_id, :loan_period, :approved
  json.url book_request_url(book_request, format: :json)
end
