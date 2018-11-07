# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
