# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  firm_id    :integer
#  line_1     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ActiveRecord::Base


  belongs_to :firm
  has_many :phones

  accepts_nested_attributes_for :phones,
                                :reject_if => :all_blank, 
                                :allow_destroy => true
                                #reject_if: 
                                #lambda {|attributes| attributes['number'].blank?}

  attr_accessible :firm_id, :line_1, :phones_attributes

end
