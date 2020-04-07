require('pg')

class SqlRunner

<<<<<<< HEAD
  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'imdb', host: 'localhost'})
=======
  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'imdb', host: 'localhost' })
>>>>>>> 1da997ad44b2396da72449b1dcb9587c18d079c2
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
