class PetShop

  attr_reader :name, :total_cash, :pets_sold

  def initialize(name, pets, total_cash)
    @name = name
    @pets = pets
    @total_cash = total_cash
    @pets_sold = 0
  end

  def stock_count()
    return @pets.size()
  end

  def increase_pets_sold()
    @pets_sold += 1
  end

  def increase_total_cash(amount)
    @total_cash +=  amount
  end

  def add_pet(pet)
    @pets.push(pet)
  end

  def remove_pet(pet)
    @pets.delete(pet)
  end

  def find_pet_by_name(name)
    for pet in @pets
      if pet.name == name
        return pet
      end
    end
    return nil
  end

  def sell_pet_to_customer(name, customer)
    pet = find_pet_by_name(name)
    customer.add_pet(pet)
    remove_pet(pet)
    increase_pets_sold()
  end

end
