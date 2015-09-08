class Worker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name, presence: {message: "Debe ingresar su nombre"}
  validates :last_name, presence: {message: "Debe ingresar su apellido"}
  validates :rut, presence: {message: "Debe ingresar su RUT"}, format: {with: /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i,
                             message: "Formato no válido"},
                             uniqueness: true
end
