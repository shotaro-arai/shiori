class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  validates :nickname, presence: true, uniqueness: true
  validates :email, uniqueness: true

  PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は英字か数字のみ使用できます' 
end
