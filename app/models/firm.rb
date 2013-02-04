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

  belongs_to :user
  belongs_to :category

  has_many :phones
  accepts_nested_attributes_for :phones, 
                                reject_if: 
                                lambda {|attributes| attributes['number'].blank?}

  attr_accessible :description, :name, :category_id, 
                  :favatar, :remote_favatar_url, :favatar_cache, :remove_favatar,
                  :phones_attributes

  validates :user_id, presence: true
  validates :slug, uniqueness: true, presence: true



  mount_uploader :favatar, FavatarUploader

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize
  end


end
