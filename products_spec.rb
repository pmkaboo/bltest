require 'minitest/autorun'
require './product'
require './products'

describe Products do
	before do
		@product1 = Product.new 'p1', 1
		@product2 = Product.new 'p2', 2
		@product3 = Product.new 'p3', 3
		@product4 = Product.new 'p4', 1
		@product5 = Product.new 'p5', 2
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

	describe '#price_min' do
		it 'returns collection of products with min price' do
			@products << @product4
			@products.price_min.must_include @product1
			@products.price_min.must_include @product4
			@products.price_min.wont_include @product2
		end
	end

	describe '#price_max' do
		it 'returns collection of products with max price' do
			@products << @product5
			@products.price_max.must_include @product2
			@products.price_max.must_include @product5
			@products.price_max.wont_include @product1
		end
	end
end
