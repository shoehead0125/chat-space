class Group < ApplicationRecord
  validates_presence_of :name
  has_many :users, through: :user_groups
  has_many :user_groups
  accepts_nested_attributes_for :user_groups
end
