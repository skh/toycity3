# lib/customer.rb

class Customer

	@@customers = []

	attr_reader :name

	def initialize(options={})
		@name = options[:name]
		add_to_customers
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