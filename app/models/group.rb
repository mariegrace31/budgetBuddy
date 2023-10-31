class Group < ApplicationRecord
  belongs_to :user
  has_many :exchange_groups, dependent: :destroy
end
