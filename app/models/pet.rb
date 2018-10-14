class Pet < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
end
