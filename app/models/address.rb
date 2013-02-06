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

  attr_accessible :firm_id, :line_1

end
