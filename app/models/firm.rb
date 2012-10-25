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
#

class Firm < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :user
  validates :user_id, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
