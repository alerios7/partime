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

class Employer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validate :company_id_present, on: :create
  validates :name, presence: {message: "no puede ser vacio"}
  validates :last_name, presence: {message: "no puede ser vacio"}
  attr_accessor :token
  before_validation :set_company_id, on: :create
  belongs_to :company
  has_many :stores
  has_many :jobs

  protected

    def company_id_present
      errors.add(:token, "no tiene asociada ninguna empresa") unless self.company_id.present?
    end

    def set_company_id
      company = Company.find_by(token: self.token)
      self.company_id = company.id  if company.present?
    end
end
