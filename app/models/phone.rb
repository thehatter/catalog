class Phone < ActiveRecord::Base
  belongs_to :firm

  Phone::NUMBERTYPES = %w(mts velcom life city)
  # validates :number, :length => { :minimum => 1 }
  # validates :number_type, :length => { :minimum => 1 }
  validates :number_type, inclusion: {in: Phone::NUMBERTYPES}

  
  attr_accessible :number, :number_type
end