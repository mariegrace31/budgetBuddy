class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exchanges, class_name: 'exchange', foreign_key: 'author_id', dependent: :destroy
  has_many :groups, dependent: :destroy
end
