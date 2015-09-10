# == Schema Information
#
# Table name: employers
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  company_id             :integer
#  name                   :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class EmployerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
