require_relative("../db/sql_runner")
require_relative("./casting")
require_relative("./star")

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

  def self.all()
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    return movies.map {|movie| Movie.new(movie)}
  end

  def update()
    sql = "Update movies SET (title, genre, budget) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @budget, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_by_id(id)
    sql = "SELECT * FROM movies WHERE id = $1"
    values = [id]
    movie = SqlRunner.run(sql, values).first()
    return Movie.new(movie)
  end

  def stars()
    sql = "SELECT stars.* FROM stars INNER JOIN castings ON stars.id = castings.star_id WHERE castings.movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return stars.map { |star| Star.new(star)}
  end

  def castings()
    sql = "SELECT * FROM castings WHERE movie_id = $1"
    values = [@id]
    castings = SqlRunner.run(sql, values)
    return castings.map {|casting| Casting.new(casting)}
  end

  def remaining_budget()
    # sql = "SELECT SUM(castings.fee) FROM castings WHERE castings.movie_id = $1"
    # values = [@id]
    # result = SqlRunner.run(sql, values).first()
    # return @budget - result['sum'].to_i()

    all_castings = castings()
    total_fees = all_castings.sum {|casting| casting.fee}
    return @budget - total_fees

  end





end
