class Profile < ApplicationRecord
  has_one_attached :photo
  validates :name, presence: true
  validates :job, presence: true
end
