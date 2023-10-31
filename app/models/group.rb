class Group < ApplicationRecord
  belongs_to :user
  has_many :exchange_groups, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
