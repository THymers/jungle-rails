require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # Initial example to ensure a product with all fields set saves successfully
    it 'is valid with valid attributes' do
      @category = Category.create(name: 'Test Category')
      @product = Product.new(
        name: 'Test Product',
        price: 100,
        quantity: 10,
        category: @category
      )
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @category = Category.create(name: 'Test Category')
      @product = Product.new(
        name: nil,
        price: 100,
        quantity: 10,
        category: @category
      )
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

it 'is not valid without a price' do
  @category = Category.create(name: 'Test Category')
  @product = Product.new(
    name: 'Test Product',
    price: nil,  # Testing for nil price
    quantity: 10,
    category: @category
  )
  expect(@product).not_to be_valid
  expect(@product.errors.full_messages).to include("Price must be greater than 0")

  @product.price = 0  # Testing for zero price
  expect(@product).not_to be_valid
  expect(@product.errors.full_messages).to include("Price must be greater than 0")
end

    it 'is not valid without a quantity' do
      @category = Category.create(name: 'Test Category')
      @product = Product.new(
        name: 'Test Product',
        price: 100,
        quantity: nil,
        category: @category
      )
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product = Product.new(
        name: 'Test Product',
        price: 100,
        quantity: 10,
        category: nil
      )
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end