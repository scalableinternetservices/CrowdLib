
class BookRequestSerializer < ActiveModel::Serializer
  attributes :id, :book_id, :lender_id, :borrower_id, :loan_period, :approved

end

