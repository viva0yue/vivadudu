class Review < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :restaurant

  belongs_to :user

  # Indirect associations

  # Validations

end
