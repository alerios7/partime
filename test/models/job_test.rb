# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  start_date  :datetime
#  finish_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  store_id    :integer
#  worker_id   :integer
#  employer_id :integer
#  state       :string
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
