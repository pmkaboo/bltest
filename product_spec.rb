require 'minitest/autorun'
require './product'

describe Product do
	before do
		@product = Product.new 'name', 100, 20
	end

	describe '#name' do
		it 'returns name of the product' do
			@product.name.must_equal 'name'
		end
	end

	describe '#price' do
		it 'returns price of the product' do
			@product.price.must_equal 100
		end
	end

	describe '#vat' do
		it 'returns vat of the product' do
			@product.vat.must_equal 20
		end
	end

	describe '#vat_price' do
		it 'returns vat price of the product' do
			@product.vat_price.must_equal 120
		end
	end

	describe '#<<' do
		it 'adds sub product to the product' do
			product2 = Product.new 'name2', 1, 1
			@product << product2
			@product.children.must_include product2
			product3 = Product.new 'name3', 1, 1, @product
			@product.children.must_include product3
		end
	end

	describe '#descendants' do
		it 'creates an array of all descendats of the product' do
			product2 = Product.new 'name2', 100, 10, @product
			product3 = Product.new 'name3', 100, 10, product2
			@product.descendants.must_include product2
			@product.descendants.must_include product3
		end
	end
end
