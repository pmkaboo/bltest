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

	def sub_products_price vat = false
		price_type = vat ? 'vat_price' : 'price'
		descendants_price(self, price_type)
	end

	def print_tree
		puts 'NAME | PRICE (self + components) | VAT PRICE (self + components)'
		puts self
		print_sub_tree(self, 1)
	end

	def << child
		@children << child
		self
	end

	def to_s
		name + ' | ' + price.to_s + ' + ' + sub_products_price.to_s + ' | ' + vat_price.to_s + ' + ' + sub_products_price(true).to_s
	end

	private
	def descendants_price product, price_type
		product.children.map do |child|
			child.send(price_type) + descendants_price(child, price_type)
		end.sum
	end

	def print_sub_tree(product, depth)
		product.children.each do |child|
			puts ('--' * depth) + child.to_s
			print_sub_tree(child, depth + 1)
		end
	end
end
