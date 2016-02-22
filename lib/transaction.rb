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

	def self.all
		return @@transactions
	end

	def self.find(id)
		return @@transactions.find {|t| t.id == id}
	end

end