# == Schema Information
#
# Table name: phones
#
#  id          :integer          not null, primary key
#  number      :string(255)
#  number_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  firm_id     :string(255)
#

require 'spec_helper'

describe Phone do
  pending "add some examples to (or delete) #{__FILE__}"
end
