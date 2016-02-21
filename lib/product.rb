# lib/product.rb

class Product

	@@products = []

	attr_reader :title, :price, :stock

  def initialize(options={})
  	@title = options[:title]
  	@price = options[:price]
  	@stock = options[:stock]
  	add_to_products
  end

  def self.find_by_title(title)
  	@@products.find {|p| p.title == title}
  end

  def self.all
  	return @@products
  end

  private

  def add_to_products
  	product = self.class.find_by_title(@title)
  	if product 
  		raise DuplicateProductError, "#{@title} already exists."
  	else
	  	@@products << self
	  end
  end
end