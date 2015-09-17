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
  validates :name, presence: {message: "no puede quedar quedar en blanco"}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX}
  validates :address, presence: true
  before_create :set_company_id, on: :create

  belongs_to :company
  belongs_to :employer
  has_many :jobs, dependent: :destroy

  scope :instance_company, lambda {|employer| where("stores.company_id = ?", employer.company_id )}
  ->{where(company_id: current_employer.company_id)}

  paginates_per 25

  protected
  def set_company_id
    self.company_id = Employer.find_by(id: self.employer_id).company_id
  end

end
