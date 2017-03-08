class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, through: :user_groups
  has_many :user_groups

  scope :including_name_or_kana, ->(reg){ where("name like ?", reg).or where("kana like ?", reg) }
end
