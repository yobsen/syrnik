class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
