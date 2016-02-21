# lib/product.rb

class Product

	@@products = []

	attr_reader :title

  def initialize(options={})
  	@title = options[:title]
  	add_to_products
  end

  def self.all
  	return @@products
  end

  private

  def add_to_products
  	product = @@products.find {|p| p.title == @title}
  	if product 
  		raise DuplicateProductError, "#{@title} already exists."
  	else
	  	@@products << self
	  end
  end
end