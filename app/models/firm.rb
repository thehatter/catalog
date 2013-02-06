# == Schema Information
#
# Table name: firms
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  description       :text
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string(255)
#  category_id       :integer
#  favatar           :string(255)
#  short_description :text
#

class Firm < ActiveRecord::Base
  before_validation :generate_slug

  belongs_to :user
  belongs_to :category

  has_many :phones
  has_many :addresses

  accepts_nested_attributes_for :phones, 
                                reject_if: 
                                lambda {|attributes| attributes['number'].blank?}
  accepts_nested_attributes_for :addresses, 
                                :reject_if => :all_blank, 
                                :allow_destroy => true

  attr_accessible :short_description, :description, :name, :category_id, 
                  :favatar, :remote_favatar_url, :favatar_cache, :remove_favatar,
                  :phones_attributes, :addresses_attributes

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
