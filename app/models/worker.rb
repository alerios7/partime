# == Schema Information
#
# Table name: workers
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
#  name                   :string
#  last_name              :string
#  rut                    :text
#  birthdate              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  college                :string
#  career                 :string
#  address                :string
#

class Worker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name, presence: {message: "no puede ser vacio"}
  validates :last_name, presence: {message: "no puede ser vacio"}
  validates :rut, format: {with: /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i, message: "formato no válido"},
                  uniqueness: true, on: :update
  has_many :jobs
end
