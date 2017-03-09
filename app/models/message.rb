class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates_presence_of :body
  mount_uploader :image, ImageUploader
end
