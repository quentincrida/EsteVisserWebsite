class River

  attr_reader(:name)

  def initialize(name, fishes)
    @name = name
    @fishes = fishes
  end

  def number_of_fishes
    return @fishes.size
  end

  def get_fish
    return @fishes.pop
  end

end
