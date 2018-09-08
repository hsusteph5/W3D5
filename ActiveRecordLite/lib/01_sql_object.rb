require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    table = self.table_name
    @arr ||= DBConnection.execute2(<<-SQL)
    SELECT
      *
    FROM
      #{table}
    SQL
    @arr.first.map {|el| el.to_sym}
  end

  def self.finalize!
    cols = self.columns
    cols.each do |name|
      define_method(name) do
        attributes[name]
      end

#attributes the method[name]
      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    # ...

  end

  def self.table_name
    # debugger
    name = "#{self.to_s.downcase}s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

#how do you call upon the class?
  def initialize(params = {})
      # debugger
      # unless self.columns.include?(attr_name.to_sym)
      #   raise "unknown attribute '#{attr_name}'"
      # end
    # end
    # raise "unknown attribute '#{params.keys}'"
  end

  def attributes
    #want attributes to be hash
    @attributes ||= {}

  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
