require_relative('../db/sql_runner')


class MagicalItem

  attr_accessor :id, :wizard_id, :wand_id

  def initialize(options)
    @id = options['id']
    @wizard_id = options['wizard_id'].to_i
    @wand_id = options['wand_id'].to_i
  end

  def save
    sql = "INSERT INTO magical_items (wizard_id, wand_id) VALUES (#{@wizard_id}, #{@wand_id}) RETURNING *"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def wands
    sql = "SELECT * FROM wands WHERE id = #{@wand_id}"
    wands = Wand.map_items(sql)
    return wands
  end

  def wizards
    sql = "SELECT * FROM wizards WHERE id = #{@wizard_id}"
    wizards = Wizard.map_items(sql)
    return wizards
  end


  def self.delete_all
    sql = " DELETE FROM magical_items"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM magical_items"
    return SqlRunner.map_items(sql)
  end
  
  def self.map_items(sql)
    magical_items = SqlRunner.run(sql)
    result = magical_items.map{ |magical_item| MagicalItem.new(magical_item) }
    return result
  end

  def self.map_item(sql)
    many = MagicalItem.map_items
    return many.first
  end

end