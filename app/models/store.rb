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

class Store < ActiveRecord::Base
end
