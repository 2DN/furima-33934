class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_taken

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :days_taken_id
  end

  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
end
