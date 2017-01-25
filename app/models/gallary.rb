class Gallary < ApplicationRecord
	mount_uploader :image, GallaryUploader
end
