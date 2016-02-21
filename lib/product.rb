# lib/product.rb

class Product

	@@products = []

  def initialize(options={})
  	@@products << self
  end

  def self.all
  	return @@products
  end
end