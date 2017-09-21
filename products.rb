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

	def price_sum
		@collection.map(&:price).sum
	end

	def vat_price_sum
		@collection.map(&:vat_price).sum
	end

	def price_min
		@collection.group_by(&:price).min.last
	end

	def vat_price_min
		@collection.group_by(&:vat_price).min.last
	end

	def price_max
		@collection.group_by(&:price).max.last
	end

	def vat_price_max
		@collection.group_by(&:vat_price).max.last
	end
end
