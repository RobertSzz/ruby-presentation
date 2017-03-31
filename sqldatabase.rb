require 'sqlite3'
require 'active_record'
require 'faker'

class SqlDatabase
  class Invoice < ActiveRecord::Base
  end

  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
  )

  ActiveRecord::Schema.define do
    create_table :invoices, force: true do |t|
      t.string :name
      t.string :company
      t.integer :amount
      t.boolean :paid
      t.integer :year
      t.integer :month
      t.integer :day
    end
  end
  
  def initialize(file)
    @file = file
  end
  
  def display_all
    print "\n"
    Invoice.all.each do |i|
      print i.inspect + "\n"
    end
  end
  
  def seed(n)
    (0..n).each do |i|
      hash = {
        company: 'Company' + Faker::Company.name,
        amount: 1000,
        paid: false,
        year: 2016,
        month: 7,
        day: 18
      }
      Invoice.create(hash).inspect
    end
  end
  
  def update(hash)
    Invoice.update(hash.delete('id'),hash)
  end
  
  def destroy(id)
    Invoice.destroy(id)
  end
  
  def create(hash)
    Invoice.create(hash)
  end
end