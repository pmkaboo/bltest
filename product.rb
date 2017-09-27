require 'bigdecimal'
require 'bigdecimal/util'

class Product
	attr_accessor :name, :price, :vat
	attr_reader :children
	attr_reader :parent

	def initialize name, price, vat, parent = nil
		@name = name
		@price = price.to_d
		@vat = vat.to_f

		@children = []
		parent << self if parent
		@parent = parent
	end

	def vat_price
		price + price * (vat / 100)
	end

	def descendants product = self
		product.children.map do |child|
			[child, descendants(child)]
		end.flatten
	end

	def print_tree
		puts self
		print_sub_tree(self, 1)
	end

	def << child
		@children << child
		self
	end

	def to_s
		# regex truncate to always display two decimals
		name + ', ' + (price.to_s('F') + '0')[/.*\..{2}/]
	end

	private
	def print_sub_tree product, depth
		product.children.each do |child|
			puts ('--' * depth) + child.to_s
			print_sub_tree(child, depth + 1)
		end
	end

end
