require 'minitest/autorun'
require './product'

describe Product do
	before do
		@product = Product.new
	end

	describe '#name' do
		it 'returns name of the product' do
			@product.name.must_equal "product"
		end
	end
end