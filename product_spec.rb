require 'minitest/autorun'
require './product'

describe Product do
	before do
		@product = Product.new 'name', 123, 20
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

	describe '#vat' do
		it 'returns vat of the product' do
			@product.vat.must_equal 20
		end
	end

	describe '#vat_price' do
		it 'returns vat price of the product' do
			@product.vat_price.must_equal 147.6
		end
	end
end
