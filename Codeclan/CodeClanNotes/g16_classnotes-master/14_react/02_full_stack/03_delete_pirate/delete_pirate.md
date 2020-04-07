# React Requests - Delete a Pirate from API

## Learning Objectives

- Understand how to make a call to our Pirate API using React to delete a single Pirate.


## Duration
30 minutes.

# Intro

So far have looked at fetching Pirates from our API but we may also want to update the data. We will look here at making a request to delete a pirate.

In this case we will not set up a new route in React but rather put a delete button on a single Pirate details and use a callback to perform our delete.

# Delete Request.

> Use end point from Single Pirate Lesson

Let's start by adding the delete function in our request helper. Again we will pass in a url to hit.

```js
// request.js

get(url) {
  return fetch(url)
  .then((res) => res.json());
}

delete(url) {

} // ADDED
```

We will still be using fetch here to hit the API but we will declare that the method we want to use is `DELETE` instead of the default `GET`. We will also declare that the content type will be JSON in the headers.

These details are passed in as a parameter to the fetch method along with the url. The rest is the same as before so we will return a promise.

```js
// request.js

get(url) {
  return fetch(url)
  .then((res) => res.json());
}

delete(url) {
  return fetch(url, {
    method: "DELETE",
    headers: {'Content-Type': 'application/json'}
  })
} // ADDED
```

Ok so now we have a delete method set up let's write a method in `PirateContainer` to call it. We will pass in the id of the pirate to be deleted.

```js
// PirateContainer.js

findPirateById(id){
  // AS BEFORE
}

handleDelete(id){
  const request = new Request()
} // ADDED
```

So the url to delete a pirate from the API will be `/api/pirates/{id}`. So let's use the id we passed in to create that url and pass it to our delete method in requests.

```js
// PirateContainer.js

handleDelete(id){
  const request = new Request();
  const url = '/api/pirates/' + id;
  request.delete(url);
}
```

After this method runs we probably want to redirect back to the list of pirates. We can set `window.location` to do this.

```js
// PirateContainer.js


handleDelete(id){
  const request = new Request();
  const url = '/api/pirates/' + id;
  request.delete(url).then(() => {
    window.location = '/pirates';
  });
}
```

As we aren't referencing `this` in this method we don't need to bind it.

Lastly we will pass this method to our `PirateDetail` component as a prop.


```js
// PirateContainer.js

{/* GET ONE PIRATE */}
      <Route exact path="/pirates/:id" render={(props) =>{
        const pirate = this.findPirateById(props.match.params.id);
        return <PirateDetail pirate={pirate} onDelete={this.handleDelete}/> // MODIFIED
      }}/>

```

## Adding a delete button to our pirate.

Now we will add in the method call to `PirateDetail` component. We will also need to bind this in a constructor

```js
// PirateDetail.js
class PirateDetail extends Component {
  constructor(props){
    super(props)
    this.handleDelete = this.handleDelete.bind(this);
  }

  handleDelete(){
    this.props.onDelete(this.props.pirate.id)
  }

  // AS BEFORE
}
```

And add the button to our Pirate.

```js
// SinglePirate.js
  return (
    <div className = "component">
    <Pirate pirate = {this.props.pirate}/>
    <p>Raids:</p>
    <ul>
    {raids}
    </ul>
    <button onClick={this.handleDelete}>Delete {this.props.pirate.firstName}</button> // ADDED
    </div>
  )
```

Now when we click the delete button our Pirate should be deleted.

# Summary
- Learned how to make a call to our Pirate API using React to delete single Pirate.

# Next Lesson
- Create a Pirate
