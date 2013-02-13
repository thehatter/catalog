class Gallery < ActiveRecord::Base
  belongs_to :firm

  mount_uploader :image, GalleryUploader

  attr_accessible :alt, :firm_id, :image, :title, :weight, :image_cache
end
