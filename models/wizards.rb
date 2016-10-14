require_relative('../db/sql_runner')


class Wizard

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'] 
    @name = options['name']
  end


  def save
    sql = "INSERT INTO wizards (name) 
          VALUES ('#{@name}') RETURNING * "
    wizard = SqlRunner.run(sql).first
    @id = wizard['id'].to_i
  end

  def self.delete_all 
    sql = "DELETE FROM wizards "
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * from wizards "
    return Wizard.map_items(sql)
  end

  def wands
    sql = "SELECT w.* FROM wands w INNER JOIN magical_items m ON m.wand_id = w.id WHERE m.wizard_id = #{@id};"
    return Wand.map_items(sql)
  end

  def self.map_items(sql)
    wizards = SqlRunner.run(sql)
    result = wizards.map{|wizard| Wizard.new(wizard)}
    return result
  end

  def self.map_item
    result = Wizard.map_items
    return result.first
  end


end


