# == Schema Information
#
# Table name: companies
#
#  id                :integer          not null, primary key
#  name              :string
#  rut               :string
#  email             :string
#  phone             :string
#  contact_name      :string
#  contact_last_name :string
#  token             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :rut, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :phone, presence: true, uniqueness: true
  validates :contact_name, presence: true
  validates :contact_last_name, presence: true
  validates :token, uniqueness: true
  has_secure_token
  has_many :employers, dependent: :destroy
  has_many :stores, dependent: :destroy
  has_many :jobs, through: :stores, dependent: :destroy


end
