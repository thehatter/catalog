# == Schema Information
#
# Table name: phones
#
#  id          :integer          not null, primary key
#  number      :string(255)
#  number_type :string(255)
#  firm_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Phone < ActiveRecord::Base
  belongs_to :firm

  Phone::NUMBERTYPES = %w(mts velcom life city)
  # validates :number, :length => { :minimum => 1 }
  # validates :number_type, :length => { :minimum => 1 }
  validates :number_type, inclusion: {in: Phone::NUMBERTYPES}

  
  attr_accessible :number, :number_type
end
