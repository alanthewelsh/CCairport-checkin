require('pg')

class SQLRunner

  def self.run(sql)
    begin 
      db = PG.connect ( { dbname: 'check_in', host: 'localhost' } )
      result = db.exec(sql)
    ensure
      db.close
    end
      return result
  end

  
end