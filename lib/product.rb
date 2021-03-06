# lib/product.rb

class Product

	@@products = []

	attr_reader :title, :price, :brand
	attr_accessor :stock

  def initialize(options={})
  	@title = options[:title]
  	@price = options[:price]
  	@stock = options[:stock]
  	@brand = options[:brand]
  	add_to_products
  end

  def in_stock?
  	@stock > 0
  end

  def self.in_stock
  	@@products.select {|p| p.in_stock?}
  end

  def self.find_by_title(title)
  	@@products.find {|p| p.title == title}
  end

  def self.find_by_brand(brand)
  	@@products.select {|p| p.brand == brand}
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