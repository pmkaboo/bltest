require './product'

class Products
	attr_reader :collection

	def initialize *products
		@collection = products
	end

	def << product
		@collection << product
		self
	end

	def price_sum options = {}
		products, price_type = parse_options options
		products.map(&price_type).sum
	end

	def find minmax, options = {}
		products, price_type = parse_options options
		products.group_by(&price_type).send(minmax).last
	end

	def print_tree product = nil
		if product
			product.print_tree
		else
			@collection.each do |product|
				product.print_tree unless product.parent
			end
		end
	end

	private
	def parse_options options
		products = options[:product] ? options[:product].descendants : @collection
		price_type = options[:vat] ? :vat_price : :price
		[products, price_type]
	end
end

p1 = Product.new 'a', 1, 1
p2 = Product.new 'b', 1, 1, p1
p3 = Product.new 'c', 1, 1, p1
p10 = Product.new 'z', 1, 1
p4 = Product.new 'd', 1, 1, p2
p5 = Product.new 'e', 1, 1, p4
p6 = Product.new 'f', 1, 1
p7 = Product.new 'g', 1, 1, p6
p8 = Product.new 'h', 1, 1, p7
p9 = Product.new 'i', 1, 1
Products.new(p1,p2,p3,p10,p4,p5,p6,p7,p8,p9).print_tree(p10)