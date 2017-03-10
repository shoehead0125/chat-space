class Group < ApplicationRecord
  validates_presence_of :name
  has_many :users, through: :user_groups
  has_many :user_groups
  has_many :messages
  accepts_nested_attributes_for :user_groups

  def find_last_message
    messages.order('created_at DESC').last
  end
end
