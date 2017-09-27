class Products
	attr_reader :collection

	def initialize *products
		@collection = products
		@collection.flatten!
	end

	def << product
		@collection << product
		self
	end

	def price_sum options = {}
		products, price_type = parse_options options
		products.map(&price_type).sum
	end

	# cheapest => minmax = 'min'
	# most expensive => minmax = 'max'
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
		price_type = options[:vat] ? :price_with_vat : :price
		[products, price_type]
	end
end
