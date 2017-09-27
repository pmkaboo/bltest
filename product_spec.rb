require 'minitest/autorun'
require './product'

describe Product do
	before do
		@product = Product.new 'name', 123
	end

	describe '#name' do
		it 'returns name of the product' do
			@product.name.must_equal 'name'
		end
	end

	describe '#price' do
		it 'returns price of the product' do
			@product.price.must_equal 123
		end
	end

	describe '#to_s' do
		it 'returns name and price with two decimals' do
			@product.to_s.must_equal 'name, 123.00'
			product2 = Product.new 'name2', 19.999
			product2.to_s.must_equal 'name2, 19.99'
		end
	end
end