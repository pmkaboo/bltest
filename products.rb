class Products
	attr_reader :collection

	def initialize *products
		@collection = products
	end

	def << product
		@collection << product
		self
	end

	def price_sum
		@collection.map(&:price).sum
	end
end