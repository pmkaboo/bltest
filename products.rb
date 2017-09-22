require './product'

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

	def price_sum
		@collection.map(&:price).sum
	end

	def price_min
		@collection.group_by(&:price).min.last
	end

	def price_max
		@collection.group_by(&:price).max.last
	end
end
