require('pg')

class SqlRunner

  def self.run(sql)
    begin
    db = PG.connect( { dbname: 'magicians_and_magical_items', host: 'localhost' })
    result = db.exec(sql)
    db.close
    end
    return result
  end

end


