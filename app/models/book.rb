class Book < ActiveRecord::Base
	mount_uploader :image_url, ImageUrlUploader # Tells rails to use this uploader for this model.

end
