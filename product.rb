class Product
	attr_accessor :name, :price, :vat

	def initialize name, price, vat
		@name = name
		@price = price.to_f
		@vat = vat.to_f
	end

	def vat_price
		price + price * (vat / 100)
	end
end
