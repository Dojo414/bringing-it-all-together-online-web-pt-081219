require 'pry'
class Dog
  attr_accessor :id, :name, :breed
  
  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
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
    end
    
    def self.find_by_name(name)
      sql = <<-SQL
      SELECT * FROM dogs
      WHERE dogs.name = ?
      SQL
      
      DB[:conn].execute(sql, name).map { |row| new_from_db(row)}.first
    end
        
      
  
  
end