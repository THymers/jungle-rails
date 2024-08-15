class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
  validate :price_must_be_positive

  private

  def price_must_be_positive
    if price_cents.nil? || price_cents <= 0
      errors.add(:price, 'must be greater than 0')
    end
  end
end