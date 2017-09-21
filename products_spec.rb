require 'minitest/autorun'
require './product'
require './products'

describe Products do
	before do
		@product1 = Product.new 'p1', 1
		@product2 = Product.new 'p2', 2
		@product3 = Product.new 'p3', 3
		@products = Products.new @product1, @product2
	end

	describe '#collection' do
		it 'returns collection of products' do
			@products.collection.must_include @product1
			@products.collection.must_include @product2
		end
	end

	describe '#<<' do
		it 'adds product to the collection' do
			@products << @product3
			@products.collection.must_include @product1
			@products.collection.must_include @product2
			@products.collection.must_include @product3
		end
	end

	describe '#price_sum' do
		it 'sums prices of products in the collection' do
			@products.price_sum.must_equal 3
			@products << @product3
			@products.price_sum.must_equal 6
		end
	end
end