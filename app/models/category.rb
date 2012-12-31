# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string(255)
#  slug       :string(255)
#

class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id
  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug

  has_ancestry
  has_many :firms

  # extend FriendlyId
  # friendly_id :name, use: :slugged



  def to_param
    slug
  end
  
  def generate_slug
    self.slug ||= name.parameterize
  end

end
