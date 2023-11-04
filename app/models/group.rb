class Group < ApplicationRecord
  belongs_to :user
  has_many :exchange_groups, dependent: :destroy
  has_many :exchanges, through: :exchange_groups

  validates :name, presence: true
  validates :icon, presence: true
end
