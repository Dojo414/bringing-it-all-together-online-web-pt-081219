require 'pry'
class Dog
  attr_accessor :id, :name, :breed
  
  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE dogs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT)
      SQL
      
      DB[:conn].execute(sql)
    end
    
    def self.drop_table
      sql = <<-SQL
      DROP TABLE dogs
      SQL
      
      DB[:conn].execute(sql)
    end
    
    def self.new_from_db(array)
      dog = Dog.new(name: array[1], breed: array[2], id: array[0])
      dog
      binding.pry
    end
        
      
  
  
end