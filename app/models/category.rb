# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  url            :string(255)
#  weight         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ancestry       :string(255)
#  slug           :string(255)
#  ancestry_depth :integer
#

class Category < ActiveRecord::Base
  
  has_ancestry :cache_depth => true
  has_many :firms

  attr_accessible :name, :parent_id, :ancestry_depth, :url, :weight
  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug



  def to_param
    slug
  end
  
  def generate_slug
    self.slug ||= url.parameterize
  end

end
