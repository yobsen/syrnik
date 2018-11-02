class Pet < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates :age, numericality: { greater_than_or_equal_to: 0 }
  validates :animal, :avatar, presence: true
  end
