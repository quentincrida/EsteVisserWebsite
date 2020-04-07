class Room

  attr_accessor(:name, :max_capacity, :songs, :guests, :till)

  def initialize(name, max_capacity, songs, entry_fee)
    @name = name
    @max_capacity = max_capacity
    @songs = songs
    @guests = []
    @entry_fee = entry_fee
    @till = 0
  end

  def number_of_songs
    return @songs.count
  end

  def number_of_guests
    return @guests.count
  end

  def add_song(song)
    @songs << song
  end

  def add_multiple_songs(songs)
    @songs.concat(songs)
  end


  def check_in_guests(guests)
    return if !free_space?(guests)

    guests.each do |guest|
      if guest.sufficient_funds_for_entry?(@entry_fee)
        check_in_guest(guest)
      end
    end

  end

  def check_in_guest(guest)
    guest.deduct_funds(@entry_fee)
    add_fee_to_till()
    @guests.push(guest)
  end

  def check_out_guests
    @guests.clear
  end

  def add_fee_to_till()
    @till += @entry_fee
  end

  def free_space?(guests)
    return guests.length <= available_spaces()
  end

  def available_spaces
    return @max_capacity - @guests.size
  end


end