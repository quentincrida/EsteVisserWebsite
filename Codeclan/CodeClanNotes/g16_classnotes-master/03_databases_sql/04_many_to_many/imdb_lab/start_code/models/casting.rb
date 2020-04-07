<<<<<<< HEAD
require_relative("../db/sql_runner")

class Casting

  attr_reader :id
  attr_accessor :movie_id, :star_id, :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee'].to_i
  end

  def save()
    sql = "INSERT INTO castings (movie_id, star_id, fee) VALUES ($1, $2, $3) RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values)[0];
    @id = casting['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

=======
class Casting

>>>>>>> 1da997ad44b2396da72449b1dcb9587c18d079c2
end
