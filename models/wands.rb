require_relative('../db/sql_runner')


class Wand

  attr_reader :id, :name

  def initialize(options)
    @id = options['id']
    @name = options['name']
  end


  def save
    sql = "INSERT INTO wands (name) VALUES ('#{@name}') RETURNING * "
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def wizards
    sql = "SELECT w.* FROM wizards w INNER JOIN magical_items m ON m.wizard_id = w.id WHERE m.wand_id = #{@id};"
    return Wizard.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM wands "
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM wands"
    return Wand.map_items(sql)
  end

  def self.map_items(sql)
    sql = "SELECT * FROM wands "
    wands = SqlRunner.run(sql)
    result = wands.map{ |wand| Wand.new(wand)}
    return result
  end

  def self.map_item
    result = Wand.map_items
    return result.first
  end




end