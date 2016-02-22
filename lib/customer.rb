# lib/customer.rb

class Customer

	@@customers = []

	attr_reader :name

	def initialize(options={})
		@name = options[:name]
		add_to_customers
	end

	def purchase(product)
		Transaction.new(self, product)
	end

	def return(product)
		transaction = Transaction.find(customer: self, product: product)
		if transaction
			transaction.cancel
		else
			raise NoSuchTransactionError, "#{self.name} did not buy #{product} in this store."
		end
	end

	def self.find_by_name(name)
		@@customers.find {|c| c.name == name}
	end

	def self.all
		return @@customers
	end

	private

	def add_to_customers
		customer = self.class.find_by_name(@name)
		if customer
			raise DuplicateCustomerError, "'#{@name}' already exists."
		else
			@@customers << self
		end
	end

end