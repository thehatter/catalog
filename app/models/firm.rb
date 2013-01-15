# == Schema Information
#
# Table name: firms
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#  category_id :integer
#

class Firm < ActiveRecord::Base
  before_validation :generate_slug

  attr_accessible :description, :name, :category_id, 
                  :favatar, :remote_favatar_url, :favatar_cache, :remove_favatar

  validates :user_id, presence: true
  validates :slug, uniqueness: true, presence: true

  belongs_to :user
  belongs_to :category

  mount_uploader :favatar, FavatarUploader

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize
  end


end
