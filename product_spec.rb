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
end