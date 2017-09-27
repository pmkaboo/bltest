require 'bigdecimal'
require 'bigdecimal/util'

class Product
	attr_accessor :name, :price

	def initialize name, price
		@name = name
		@price = price.to_d
	end

	def to_s
		# regex truncate to always display two decimals
		name + ', ' + (price.to_s('F') + '0')[/.*\..{2}/]
	end

end
