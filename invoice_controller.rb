require_relative 'invoice'

class AppController
  class UnauthorizedUserException < Exception
  end
  
  def initialize(user,password)
    raise UnauthorizedUserException unless is_authorized?(user, password)
  end
  
  private 
  
  def is_authorized?(user,password)
    @authorization ||= user == 'admin' && password == 'password' ? true : false
  end
end

class InvoiceController < AppController
  def save
    Invoice.new({
      "company":"Company", "amount":200000, "paid":false, "year":2016,
      "month":7, "day":18
    }).save
  end
  
  def destroy
    Invoice.new({"id"=>1}).destroy
  end
  
  def update
    Invoice.new({"id"=>4, "paid"=>true, "year"=>2016}).update
  end
  
  def display_all
    Invoice.display_all
  end
end