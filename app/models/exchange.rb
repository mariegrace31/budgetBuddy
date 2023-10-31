class Exchange < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :exchange_groups, dependent: :destroy
end
