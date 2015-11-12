class Book < ActiveRecord::Base
	belongs_to :user, class_name: User
        belongs_to :borrower, class_name: User
	has_attached_file :image, style: { medium: "300x400>", thumb: "200x300>" }, default_url: "/images/book_not_found.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
