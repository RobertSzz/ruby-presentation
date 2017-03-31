class Basket
  attr_accessor :products_list, :summary_price, :discount_price
 
  def initialize(product = nil)
    @products_list = []
    @summary_price = 0.0
	  @discount_price = 0.0
 
    self.add_product(product) unless product.nil?
  end
 
  def add_product(product)
    @products_list << product
    @summary_price += product.price
	  self.apply_discount
  end
 
  def remove_product(product)
    @products_list.delete(product)
    @summary_price -= product.price
	  self.apply_discount
  end
  
  def apply_discount
  	@discount_price = @summary_price
  	if @discount_price >= 50
  		@discount_price *= 0.85
  	elsif @discount_price >= 30
  		@discount_price *= 0.90
  	elsif @discount_price >= 20
  		@discount_price *= 0.95
    end
  end
end


class Product
  attr_accessor :name, :price
 
  def initialize(name, price = 0.0)
    @name = name
    @price = price
  end
end
 
# TESTY:
 
#Tworzymy 3 produkty
p1 = Product.new('p1', 20.0)
basket = Basket.new(p1)
 
p2 = Product.new('p2', 10.0)
basket.add_product(p2)
 
p3 = Product.new('p3', 5.0)
basket.add_product(p3)
 
 
# Wypisujemy liste produktow w koszyku i ich laczna cene:
p basket.products_list
p basket.summary_price
p basket.discount_price

 
# Usuwamy jeden produkt z koszyka
basket.remove_product(p2)
 
# Sprawdzamy, czy lista produktow i laczna cena sie zgadzaja, wypisujemy je:
p basket.products_list
p basket.summary_price
p basket.discount_price

gets

end