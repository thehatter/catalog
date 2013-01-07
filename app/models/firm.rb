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
  attr_accessible :description, :name, :category_id
  belongs_to :user
  validates :user_id, presence: true
  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug

  belongs_to :category

  # extend FriendlyId
  # friendly_id :name, use: :slugged

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize
  end

end
