# == Schema Information
#
# Table name: stores
#
#  id               :integer          not null, primary key
#  name             :string
#  email            :string
#  manager_name     :string
#  manager_lastname :string
#  phone            :string
#  address          :string
#  company_id       :integer
#  employer_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
