# lib/transaction.rb

class Transaction

	attr_reader :id, :customer, :product

	@@counter = 1
	@@transactions = []

	def initialize(customer, product)
		@id = @@counter
		@@counter += 1
		@customer = customer
		@product = product
		add_transaction
	end

	def add_transaction
		if @product.stock <= 0
			raise OutOfStockError, "'#{@product.title}' is out of stock."
		else
			@product.stock -= 1
			@@transactions << self
		end
	end

	def cancel
		@product.stock += 1
		@@transactions.delete(self)
	end

	def self.all
		return @@transactions
	end

	def self.find(options={})
		if options[:id]
			return @@transactions.find {|t| t.id == options[:id]}
		elsif options[:customer] and options[:product]
			return @@transactions.find { |t|
				t.customer == options[:customer] and t.product == options[:product]
			}
		end
	end
end