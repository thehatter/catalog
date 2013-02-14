# == Schema Information
#
# Table name: galleries
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  title      :string(255)
#  alt        :string(255)
#  weight     :integer
#  firm_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gallery < ActiveRecord::Base
  belongs_to :firm

  mount_uploader :image, GalleryUploader

  attr_accessible :alt, :firm_id, :image, :title, :weight, :image_cache
end
