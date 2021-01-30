require_relative( './models/album' )
require_relative( './models/artist' )

require( 'pry-byebug' )

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new( { 'name' => 'Oasis' } )
artist1.save();
album1 = Album.new( { 'name' => 'Definitely Maybe', 'genre' => 'BritPop', 'artist_id' => artist1.id } )
album1.save()
album2 = Album.new( { 'name' => 'Morning Glory', 'genre' => 'BritPop', 'artist_id' => artist1.id } )
album2.save()


binding.pry
nil