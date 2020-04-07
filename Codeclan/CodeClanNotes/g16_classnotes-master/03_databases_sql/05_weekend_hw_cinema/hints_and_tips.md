# Steps to set up a Ruby-PSQL App.

- Create database
- Create file/folder structure (db, models folders)
- Create a console.rb file
- Create class and make sure can create instance in console
- Create database tables (use psql to check) - `psql -d dbname -f sqlfile.sql`
- Create SqlRunner.
- Write Save method in ruby class
- Once can save write rest of CRUD functions
- Repeat for rest of classes (except SqlRunner)



### Hints


#### General

- If no errors but what you are trying looks like it isn't working try running psql -d -f command *first*, then console.rb
- If id = 0 then instance hasn't saved from db
- Save the `one` side of relationships to db first.
- Syntax errors aren't always on line that the error shows. Check lines above and below as well.

#### Specific to cinema

For advanced extensions remember that -

- You can join more than 2 tables together!
- Tickets will relate to screenings (may need to amend db structure)
- Tickets could be newed up and saved from inside the customer class.

### Errors

##### Database doesn't exist
umm.... you haven't created the database or spelled name incorrectly

##### Foreign key constraint (id = 0) doesn't exist
Haven't saved the instance of `one` side of relationship side to db.

##### Uninitialized constant
You haven't require_relatived the file of class you are trying to instantiate or misspelled

##### no method close() for nil::Nil class
Make sure you have `if db != nil` at end of db.close()
