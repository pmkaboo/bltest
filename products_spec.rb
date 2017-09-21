require 'minitest/autorun'
require './product'
require './products'

describe Products do
	before do
		@product1 = Product.new 'p1', 100, 10
		@product2 = Product.new 'p2', 200, 20
		@product3 = Product.new 'p3', 300, 30
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
			@products.price_sum.must_equal 300
			@products << @product3
			@products.price_sum.must_equal 600
		end

		it 'sums vat prices of products in the collection' do
			@products.price_sum(vat: true).must_equal 350
			@products << @product3
			@products.price_sum(vat: true).must_equal 740
		end

		it 'sums prices of sub products in the collection' do
			product2 = Product.new 'name2', 100, 10, @product1
			product3 = Product.new 'name3', 100, 10, @product1
			product4 = Product.new 'name3', 100, 10, product2
			product5 = Product.new 'name3', 100, 10, product4
			@products.price_sum(product: @product1).must_equal 400
		end

		it 'sums vat prices of sub products in the collection' do
			product2 = Product.new 'name2', 100, 10, @product1
			product3 = Product.new 'name3', 100, 10, @product1
			product4 = Product.new 'name3', 100, 10, product2
			product5 = Product.new 'name3', 100, 10, product4
			@products.price_sum(product: @product1, vat: true).must_equal 440
		end
	end

	describe '#find' do
		before do
			product4 = Product.new 'p4', 100, 40
			product5 = Product.new 'p5', 200, 50
			@products << product4
			@products << product5
			product6 = Product.new 'p6', 500, 10, @product1
			product7 = Product.new 'p7', 500, 20, @product1
			product8 = Product.new 'p8', 600, 30, @product1
			product9 = Product.new 'p9', 600, 40, @product1
			@prods1 = [@product1, product4, @product2, product5]
			@prods2 = [product6, product7, product8, product9]
		end

		def check_results results, prods, vat = false
			results.must_include prods[0]
			if vat
				results.wont_include prods[1]
			else
				results.must_include prods[1]
			end
			results.wont_include prods[2]
			results.wont_include prods[3]
		end

		it 'returns collection of products with min price' do
			results = @products.find(:min)
			check_results(results, @prods1)
		end

		it 'returns collection of products with min vat price' do
			results = @products.find(:min, vat: true)
			check_results(results, @prods1, true)
		end

		it 'returns collection of products with max price' do
			results = @products.find(:max)
			check_results(results, @prods1.reverse)
		end

		it 'returns collection of products with max vat price' do
			results = @products.find(:max, vat: true)
			check_results(results, @prods1.reverse, true)
		end

		it 'returns collection of sub products with min price' do
			results = @products.find(:min, product: @product1)
			check_results(results, @prods2)
		end

		it 'returns collection of sub products with min vat price' do
			results = @products.find(:min, vat: true, product: @product1)
			check_results(results, @prods2, true)
		end

		it 'returns collection of sub products with max price' do
			results = @products.find(:max, product: @product1)
			check_results(results, @prods2.reverse)
		end

		it 'returns collection of sub products with max vat price' do
			results = @products.find(:max, vat: true, product: @product1)
			check_results(results, @prods2.reverse, true)
		end
	end
end
