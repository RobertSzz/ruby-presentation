require 'json'
require 'fileutils'

# database access class
class Database
  def initialize(file)
    @file = file
    @temp = file + '.temp'
    @next_id = 1
  end

  def seed(n)
    File.open @file, 'w' do |f|
      (0..n).each do |i|
        hash = {
          company: 'Company', id: i, amount: 1000, paid: false, year: 2016,
          month: 7, day: 18
        }
        f.write JSON.generate hash
        f.write "\n"
      end
    end
    @next_id = n + 1
    self
  end

  def update(hash)
    File.open @temp, 'w' do |temp|
      IO.readlines(@file).each do |line|
        x = JSON.parse line
        x.merge! hash if x['id'] == hash['id']
        temp.write JSON.generate x
        temp.write "\n"
      end
    end
    FileUtils.mv(@temp, @file)
    self
  end

  def destroy(id)
    File.open @temp, 'w' do |temp|
      IO.readlines(@file).each do |line|
        x = JSON.parse line
        if x['id'] != id
          temp.write JSON.generate x
          temp.write "\n"
        end
      end
    end
    FileUtils.mv(@temp, @file)
    self
  end

  def create(data)
    File.open @file, 'a' do |file|
      h = { id: @next_id }
      entry = data.merge h
      file.write JSON.generate entry
      file.write "\n"
      @next_id += 1
    end
    self
  end
  
  def display_all
    puts "\n"
    IO.readlines(@file).each do |line|
      puts line
    end
  end
end
