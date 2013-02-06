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

require 'spec_helper'

describe Address do
  pending "add some examples to (or delete) #{__FILE__}"
end
