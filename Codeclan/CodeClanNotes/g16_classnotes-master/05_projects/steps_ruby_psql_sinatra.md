# Steps to set up a Ruby-PSQL-Sinatra App.

### Initial Planning

- Proto-Persona
- Use Case Diagram
- Class and Object Diagrams
- Activity Diagram
- User Journeys
- User Stories (If not already given)
- Implementation Constraints
- SiteMap
- Wireframes

### Initial Setup

- Create database
- Create folder structure (specs/db/models/controllers/views)
- Create empty seeds, sql and sql_runner files in db folder.
- Code the sql_runner file.

### Setting up classes and DB Tables.

- Start with the "One" side of relationship
- Write tests to create an instance of one class and to check can get properties back (you can add later tests any non-sql methods)
- Create class and make sure tests pass.
- Create database table (use psql to check) - `psql -d dbname -f sqlfile.sql`
- Add instances of the class into seeds file to use in app (Ensure you delete_all at top of file and call save on your instances)
- Write `save`, `delete_all`, `all`, `find`, `update` and `delete` methods. (Ensure you test each function in seeds before you move onto next)
- Repeat for rest of classes.
- Add in any methods to get relationship data back (e.g. get pizza_orders for a customer and vice versa)

### Controllers and Views

- Create a main controller (app.rb) in the root of project with a home `('/')` route.
- Require `sinatra` and `sinatra/contrib/all`
- `also_reload` models
- Create a layout file with a navbar and the `yield` tag.
- Create a home page and make sure the route works.
- Create controller files in the controllers folder for your classes.
- In `app.rb` require in your controller files.
- Again start with the "One" side of the relationship code the restful routes. (Index, Show, New, Create, Delete, Edit, Update)
  - Create the link to that page first, then write the route in controller and then create the view.

- Repeat restful routes for rest of controllers.

### Extensions

- Create any other routes in appropriate controller you require
- Create views for those routes (again if needed)
