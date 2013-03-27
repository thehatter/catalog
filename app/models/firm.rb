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
  belongs_to :category, :counter_cache => true

  has_many :addresses
  has_many :galleries, :order => 'weight'


  with_options :reject_if => :all_blank, :allow_destroy => true do |model|
    model.accepts_nested_attributes_for :addresses
    model.accepts_nested_attributes_for :galleries
  end

  attr_accessible :short_description, :description, :name, :category_id, 
                  :favatar, :remote_favatar_url, :favatar_cache, :remove_favatar,
                  :addresses_attributes, :galleries_attributes

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
