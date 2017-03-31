require_relative 'database'
require_relative 'sqldatabase'

class Invoice
  def initialize(params)
    @params = params
  end
  
  def self.estamblish_connection(file)
    @@database = SqlDatabase.new file
    # @@database = Database.new file
    @@database.seed 5
  end
  
  def self.display_all
    @@database.display_all
  end
  
  def save
    @@database.create @params
  end
  
  def update
    @@database.update @params
  end
  
  def destroy
    @params['id'] ? @@database.destroy(@params['id']) : false
  end
end

Invoice.estamblish_connection('db')