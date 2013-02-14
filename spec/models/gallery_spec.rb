# == Schema Information
#
# Table name: galleries
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  title      :string(255)
#  alt        :string(255)
#  weight     :integer
#  firm_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Gallery do
  pending "add some examples to (or delete) #{__FILE__}"
end
