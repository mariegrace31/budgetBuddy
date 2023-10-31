class Exchange < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :exchange_groups, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
