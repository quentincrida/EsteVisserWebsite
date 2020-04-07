<<<<<<< HEAD
require_relative("../db/sql_runner")

class Movie
  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @budget]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

=======
class Movie
>>>>>>> 1da997ad44b2396da72449b1dcb9587c18d079c2

end
