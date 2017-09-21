class Product
	attr_accessor :name, :price, :vat
	attr_reader :children

	def initialize name, price, vat, parent = nil
		@name = name
		@price = price.to_f
		@vat = vat.to_f

		@children = []
		parent << self if parent
	end

	def vat_price
		price + price * (vat / 100)
	end

	def total_price vat = false
		price_type = vat ? 'vat_price' : 'price'
		send(price_type) + descendants_price(self, price_type)
	end

	def << child
		@children << child
		self
	end

	private
	def descendants_price product, price_type
		product.children.map do |child|
			child.send(price_type) + descendants_price(child, price_type)
		end.sum
	end
end
